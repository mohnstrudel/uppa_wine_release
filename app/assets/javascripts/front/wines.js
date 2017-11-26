document.addEventListener('turbolinks:load', function () {
  var headerOpenBtn = document.getElementById('headerOpenBtn');
  var menuHeaderOpenBtn = document.getElementById('menuHeaderOpenBtn');
  var menuHeaderCloseBtn = document.getElementById('menuHeaderCloseBtn');
  var menu = document.getElementById('menu');
  var dim = document.getElementById('dim');


  // Выбор года бутылки из выпадашки на мобилках
  var winesSelector = $('#winesSelector__Title')
  if (winesSelector) {
    var winesOptions = $('#winesSelector__Options')
    var winesOptionsItems = $('[data-select-option]')
    winesSelector.on('click', function (e) {
      winesOptions.toggle('fast')
    })
    $.map(winesOptionsItems, function (option) {
      $(option).on('click', function (e) {
        var newSlug = e.target.dataset.selectOption
        var oldUrl = window.location.href
        var prevSlugStartIndex = oldUrl.lastIndexOf('/') + 1
        window.location.href = oldUrl.slice(0, prevSlugStartIndex) + newSlug
      })
    })
  }

  menuHeaderOpenBtn.onclick = function () {
    menu.classList.remove('mobileHelper')
    dim.style.display = 'block'
    setTimeout(function () {
      dim.style.opacity = '0.6'
    }, 50)
  }

  headerOpenBtn.onclick = function () {
    menu.classList.remove('mobileHelper')
  }

  menuHeaderCloseBtn.onclick = function () {
    menu.classList.add('mobileHelper')
    dim.style.opacity = '0'
    setTimeout(function () {
      dim.style.display = 'none'
    }, 300)
  }

  var winesCatalog = $('#bottles-index')
  if (winesCatalog) {
    var timeout, trackpad = false;
    this.$container = $('#bottles-index');
    var self = this;
    this.$container.on('mousewheel', function(event) {
      self.$container.scrollLeft( self.$container.scrollLeft() - ( event.deltaY * event.deltaFactor ) );
      event.preventDefault()
    });

    $('.bottle').css('transform', 'translateY(0)');

    var bottles = $('[data-wine-path]');
    $.map(bottles, function (bottle) {
      $(bottle).on('click', function (e) {
        var senderElement = e.target;
        // console.log("senderElement is: " + senderElement);
        var url = e.currentTarget.dataset.winePath
        if($(e.target).is(".bottle") || ($(e.target).is(".bottleImage"))) {
          window.location.href = window.location.origin + url
        }
      })
    })
  }

  var fakeScrollArea = $('#fakeScrollArea')
  var scrollObject = $('#scrollObject')
  if (fakeScrollArea) {
    fakeScrollArea.mousewheel(function(event, delta) {
      var currentScrollTop = scrollObject.scrollTop()
      scrollObject.scrollTop(currentScrollTop - delta)
      event.preventDefault()
    })
  }

  var slickGallery = $('#slick-gallery')
  if (slickGallery) {
    $(slickGallery).slick({
      accessibility: false,
      nextArrow: '#rightArrow',
      prevArrow: '#leftArrow',
      mobileFirst: true
    })
  }
})
