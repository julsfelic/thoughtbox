var Link = {
  updateReadStatus: function(status, data, $el) {
    var $li = $el.parents('li');
    $li.removeClass();
    $li.addClass('read-' + status)
    $li.find('#readStatus').html('Read: ' + status);
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
