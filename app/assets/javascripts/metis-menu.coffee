((global, factory) ->
  if typeof define == 'function' and define.amd
    define [ 'jquery' ], factory
  else if typeof exports != 'undefined'
    factory require('jquery')
  else
    mod = exports: {}
    factory global.jquery
    global.metisMenu = mod.exports
  return
) this, (_jquery) ->

  _interopRequireDefault = (obj) ->
    if obj and obj.__esModule then obj else default: obj

  _classCallCheck = (instance, Constructor) ->
    if !(instance instanceof Constructor)
      throw new TypeError('Cannot call a class as a function')
    return

  'use strict'
  _jquery2 = _interopRequireDefault(_jquery)
  _typeof = if typeof Symbol == 'function' and typeof Symbol.iterator == 'symbol' then ((obj) ->
    typeof obj
  ) else ((obj) ->
    if obj and typeof Symbol == 'function' and obj.constructor == Symbol and obj != Symbol.prototype then 'symbol' else typeof obj
  )
  _createClass = do ->

    defineProperties = (target, props) ->
      i = 0
      while i < props.length
        descriptor = props[i]
        descriptor.enumerable = descriptor.enumerable or false
        descriptor.configurable = true
        if 'value' of descriptor
          descriptor.writable = true
        Object.defineProperty target, descriptor.key, descriptor
        i++
      return

    (Constructor, protoProps, staticProps) ->
      if protoProps
        defineProperties Constructor.prototype, protoProps
      if staticProps
        defineProperties Constructor, staticProps
      Constructor
  MetisMenu = (($) ->
    `var MetisMenu`
    NAME = 'metisMenu'
    DATA_KEY = 'metisMenu'
    EVENT_KEY = '.' + DATA_KEY
    DATA_API_KEY = '.data-api'
    JQUERY_NO_CONFLICT = $.fn[NAME]
    TRANSITION_DURATION = 350
    Default = 
      toggle: true
      doubleTapToGo: false
      preventDefault: true
      activeClass: 'active'
      collapseClass: 'collapse'
      collapseInClass: 'in'
      collapsingClass: 'collapsing'
    Event = 
      SHOW: 'show' + EVENT_KEY
      SHOWN: 'shown' + EVENT_KEY
      HIDE: 'hide' + EVENT_KEY
      HIDDEN: 'hidden' + EVENT_KEY
      CLICK_DATA_API: 'click' + EVENT_KEY + DATA_API_KEY
    transition = false
    TransitionEndEvent = 
      WebkitTransition: 'webkitTransitionEnd'
      MozTransition: 'transitionend'
      OTransition: 'oTransitionEnd otransitionend'
      transition: 'transitionend'
    Util = 
      TRANSITION_END: 'mmTransitionEnd'
      triggerTransitionEnd: (element) ->
        $(element).trigger transition.end
        return
      supportsTransitionEnd: ->
        Boolean transition

    getSpecialTransitionEndEvent = ->
      {
        bindType: transition.end
        delegateType: transition.end
        handle: (event) ->
          if $(event.target).is(this)
            return event.handleObj.handler.apply(this, arguments)
          return

      }

    transitionEndTest = ->
      if window.QUnit
        return false
      el = document.createElement('mm')
      for name of TransitionEndEvent
        if el.style[name] != undefined
          return { end: TransitionEndEvent[name] }
      false

    transitionEndEmulator = (duration) ->
      _this2 = this
      called = false
      $(this).one Util.TRANSITION_END, ->
        called = true
        return
      setTimeout (->
        if !called
          Util.triggerTransitionEnd _this2
        return
      ), duration
      return

    setTransitionEndSupport = ->
      transition = transitionEndTest()
      if Util.supportsTransitionEnd()
        $.event.special[Util.TRANSITION_END] = getSpecialTransitionEndEvent()
      return

    setTransitionEndSupport()
    MetisMenu = do ->
      `var MetisMenu`

      MetisMenu = (element, config) ->
        _classCallCheck this, MetisMenu
        @_element = element
        @_config = @_getConfig(config)
        @_transitioning = null
        @init()
        return

      _createClass MetisMenu, [
        {
          key: 'init'
          value: ->
            self = this
            $(@_element).find('li.' + @_config.activeClass).has('ul').children('ul').attr('aria-expanded', true).addClass @_config.collapseClass + ' ' + @_config.collapseInClass
            $(@_element).find('li').not('.' + @_config.activeClass).has('ul').children('ul').attr('aria-expanded', false).addClass @_config.collapseClass
            #add the 'doubleTapToGo' class to active items if needed
            if @_config.doubleTapToGo
              $(@_element).find('li.' + @_config.activeClass).has('ul').children('a').addClass 'doubleTapToGo'
            $(@_element).find('li').has('ul').children('a').on Event.CLICK_DATA_API, (e) ->
              _this = $(this)
              _parent = _this.parent('li')
              _siblings = _parent.siblings('li').children('a')
              _list = _parent.children('ul')
              if self._config.preventDefault
                e.preventDefault()
              if _this.attr('aria-disabled') == 'true'
                return
              if _parent.hasClass(self._config.activeClass) and !self._config.doubleTapToGo
                _this.attr 'aria-expanded', false
                self._hide _list
              else
                self._show _list
                _this.attr 'aria-expanded', true
                if self._config.toggle
                  _siblings.attr 'aria-expanded', false
              if self._config.onTransitionStart
                self._config.onTransitionStart e
              #Do we need to enable the double tap
              if self._config.doubleTapToGo
                #if we hit a second time on the link and the href is valid, navigate to that url
                if self._doubleTapToGo(_this) and _this.attr('href') != '#' and _this.attr('href') != ''
                  e.stopPropagation()
                  document.location = _this.attr('href')
                  return
              return
            return

        }
        {
          key: '_show'
          value: (element) ->
            if @_transitioning or $(element).hasClass(@_config.collapsingClass)
              return
            _this = this
            _el = $(element)
            startEvent = $.Event(Event.SHOW)
            _el.trigger startEvent
            if startEvent.isDefaultPrevented()
              return
            _el.parent('li').addClass @_config.activeClass
            if @_config.toggle
              @_hide _el.parent('li').siblings().children('ul.' + @_config.collapseInClass).attr('aria-expanded', false)
            _el.removeClass(@_config.collapseClass).addClass(@_config.collapsingClass).height 0
            @setTransitioning true

            complete = ->
              _el.removeClass(_this._config.collapsingClass).addClass(_this._config.collapseClass + ' ' + _this._config.collapseInClass).height('').attr 'aria-expanded', true
              _this.setTransitioning false
              _el.trigger Event.SHOWN
              return

            if !Util.supportsTransitionEnd()
              complete()
              return
            _el.height(_el[0].scrollHeight).one Util.TRANSITION_END, complete
            transitionEndEmulator TRANSITION_DURATION
            return

        }
        {
          key: '_hide'
          value: (element) ->
            if @_transitioning or !$(element).hasClass(@_config.collapseInClass)
              return
            _this = this
            _el = $(element)
            startEvent = $.Event(Event.HIDE)
            _el.trigger startEvent
            if startEvent.isDefaultPrevented()
              return
            _el.parent('li').removeClass @_config.activeClass
            _el.height(_el.height())[0].offsetHeight
            _el.addClass(@_config.collapsingClass).removeClass(@_config.collapseClass).removeClass @_config.collapseInClass
            @setTransitioning true

            complete = ->
              if _this._transitioning and _this._config.onTransitionEnd
                _this._config.onTransitionEnd()
              _this.setTransitioning false
              _el.trigger Event.HIDDEN
              _el.removeClass(_this._config.collapsingClass).addClass(_this._config.collapseClass).attr 'aria-expanded', false
              return

            if !Util.supportsTransitionEnd()
              complete()
              return
            if _el.height() == 0 or _el.css('display') == 'none' then complete() else _el.height(0).one(Util.TRANSITION_END, complete)
            transitionEndEmulator TRANSITION_DURATION
            return

        }
        {
          key: '_doubleTapToGo'
          value: (element) ->
            if element.hasClass('doubleTapToGo')
              element.removeClass 'doubleTapToGo'
              return true
            if element.parent().children('ul').length
              $(@_element).find('.doubleTapToGo').removeClass 'doubleTapToGo'
              element.addClass 'doubleTapToGo'
              return false
            return

        }
        {
          key: 'setTransitioning'
          value: (isTransitioning) ->
            @_transitioning = isTransitioning
            return

        }
        {
          key: 'dispose'
          value: ->
            $.removeData @_element, DATA_KEY
            $(@_element).find('li').has('ul').children('a').off 'click'
            @_transitioning = null
            @_config = null
            @_element = null
            return

        }
        {
          key: '_getConfig'
          value: (config) ->
            config = $.extend({}, Default, config)
            config

        }
      ], [ {
        key: '_jQueryInterface'
        value: (config) ->
          @each ->
            $this = $(this)
            data = $this.data(DATA_KEY)
            _config = $.extend({}, Default, $this.data(), (if typeof config == 'undefined' then 'undefined' else _typeof(config)) == 'object' and config)
            if !data and /dispose/.test(config)
              @dispose()
            if !data
              data = new MetisMenu(this, _config)
              $this.data DATA_KEY, data
            if typeof config == 'string'
              if data[config] == undefined
                throw new Error('No method named "' + config + '"')
              data[config]()
            return

      } ]
      MetisMenu
    $.fn[NAME] = MetisMenu._jQueryInterface
    $.fn[NAME].Constructor = MetisMenu

    $.fn[NAME].noConflict = ->
      $.fn[NAME] = JQUERY_NO_CONFLICT
      MetisMenu._jQueryInterface

    MetisMenu
  )(jQuery)
  return