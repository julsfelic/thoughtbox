function fuzzyMatch(str, pattern) {
  if (pattern === '') { return true; }
  pattern = pattern.split("").reduce(function(a,b){ return a+".*"+b; });
  return (new RegExp(pattern)).test(str);
}

var Link = {
  updateReadStatus: function(status, data, $el) {
    var $li = $el.parents('li');
    $li.removeClass();
    $li.addClass('read-' + status)
    $li.find('#readStatus').html('Read: ' + status);
  },
  find_by_text: function(text) {
    var links = $('li');

    links.each(function(i, val) {
      var linkText = $(val).find('#linkTitle').text()
      if (fuzzyMatch(linkText, text)) {
        $(val).removeClass('hide');
      } else {
        $(val).addClass('hide');
      }
    });
  },
  filter: {
    alphabetically: function() {
      var links = document.getElementsByTagName('li');
      var linksArray = Array.prototype.slice.call(links);

      var sortedLinks = linksArray.sort(function(a, b) {
        $(a).removeClass('hide');
        var aText = $(a).find('#linkTitle').text(),
          bText = $(b).find('#linkTitle').text();
        return bText < aText;
      });

      $('.links').replaceWith(sortedLinks);
    },
    read: function() {
      var links = $('li');

      links.each(function(i, val) {
        $(val).removeClass('hide');
        var linkStatus = $(val).find('#readStatus').text();
        if (linkStatus !== 'Read: true') { $(val).addClass('hide') }
      });
    },
    unread: function() {
      var links = $('li');

      links.each(function(i, val) {
        $(val).removeClass('hide');
        var linkStatus = $(val).find('#readStatus').text();
        if (linkStatus === 'Read: true') { $(val).addClass('hide') }
      });
    }
  },
  find_by_filter: function(val) {
    this.filter[val]();
  }
};

var LinkRepo = {
  updateReadStatus: function(id, status, $el) {
    $.ajax({
      url: '/links/' + id,
      data: { link: { read: status } },
      dataType: 'json',
      method: 'put',
      success: function(data) {
        Link.updateReadStatus(status, data, $el);
      }
    });
  }
}

$(document).on('click', '#markAsRead', function(e) {
  var $this = $(this),
    id = $this.parents('li').data('id');
    e.preventDefault();
    LinkRepo.updateReadStatus(id, true, $this);
});

$(document).on('click', '#markAsUnread', function(e) {
  var $this = $(this),
    id = $this.parents('li').data('id');
    e.preventDefault();
    LinkRepo.updateReadStatus(id, false, $this);
});

$('#searchBar').on('keyup', function(e) {
  var searchText = $(this).val();
  Link.find_by_text(searchText);
});

$('#sort').on('change', function(e) {
  var val = $(this).val();
  Link.find_by_filter(val);
})
