const highlight = () => {

  $('.text-content').on('mouseup', function(e){
    var selectedStr;
    if(window.getSelection){
      selectedStr = window.getSelection().toString();
      if(selectedStr !== '' && selectedStr !== '\n'){
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/pages/?text=${selectedStr}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;
          }
          const item = XHR.response.post;
          for (var i=0, len=item.length; i<len; i++){
            var txt = $(this).html();
            $(this).html(
              txt.replace(item[i],
                  `<span style="background-color:#FFF450">${item[i]}</span>`)
            );
          }  
        }
      }
    }
  });
};

window.addEventListener("load", highlight);