const highlight = () => {

  // ページ切り替え時にハイライトを読み込む
  const XHR = new XMLHttpRequest();
  XHR.open("GET", '/highlights/load', true);
  XHR.responseType = "json";
  XHR.send();
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    const item = XHR.response.post;
    for (let i=0, len=item.length; i<len; i++){
      const txt = $('.text-content').html();
      $('.text-content').html(
        txt.replace(item[i],
            `<span style="background-color:#FFF450", class='highlight-text'>${item[i]}</span>`)
      );
    }  
  }

  // ハイライトの削除
  $(document).on('click', '.highlight-text', function(){
    let clickedStr = $(this).text();
    const params = (new URL(document.location)).searchParams;
    const pageNum = params.get('pagenum')
    const bookNum = params.get('booknum')
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/highlights/delete?booknum=${bookNum}&pagenum=${pageNum}&text=${clickedStr}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
        const txt = $('.text-content').html();
        $('.text-content').html(
          txt.replace(`<span style="background-color:#FFF450" ,="" class="highlight-text">${item}</span>`,
              item)
        );
    }
  })

  // ハイライトの追加
  $('.text-content').on('mouseup', function(){
    let selectedStr;
    if(window.getSelection){
      selectedStr = window.getSelection().toString();
      if(selectedStr !== '' && selectedStr !== '\n'){
        const params = (new URL(document.location)).searchParams;
        const pageNum = params.get('pagenum')
        const bookNum = params.get('booknum')
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/highlights/create?book_id=${bookNum}&pagenum=${pageNum}&text=${selectedStr}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;
          }
          const item = XHR.response.post;
          for (let i=0, len=item.length; i<len; i++){
            const txt = $(this).html();
            $(this).html(
              txt.replace(item[i],
                  `<span style="background-color:#FFF450", class='highlight-text'>${item[i]}</span>`)
            );
          }  
        }
      }
    }
  });
};

window.addEventListener("load", highlight);
