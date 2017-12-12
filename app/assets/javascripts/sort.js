$( document ).ready(function() {
  var sortItems = $(".sortable_items");

  if (sortItems) {
    var url = sortItems.data('url');
    sortItems.sortable({
      handle: ".handle",
      stop : function(event, ui) {
        var children = $(this).children();
        console.log(url)
        if (url){
          var sort = [];
          children.each(function() {
            var item = $(this).data('item');
            sort.push(item);
          });
          console.log(sort)
          $.ajax({
            url : url,
            type : 'post',
            data : {
              sort : sort,
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {

            },
            success : function(response) {
              console.log('ok');
            },
          });
        }else{
          var children = $(this).children();
          children.each(function(index) {
            $(this).find("._priority").val(index)
          });             
        }
      },
    });
    sortItems.disableSelection();
  }
});

