const highlight = () => {

  // ハイライトの読み込み
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
  
  // 本とページ数を取得
  const url = location.href;
  const result = url.match("books/([0-9]+)/pages/([0-9]+)")
  const bookId = result[1]
  const pageNum = result[2]

  // ハイライトの追加
  $('.text-content').on('mouseup', function(){
    let selectedStr;
    if(window.getSelection){
      selectedStr = window.getSelection().toString().trim();
      if(selectedStr !== '' && !(selectedStr.includes('\n'))){
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/highlights/create?book_id=${bookId}&pagenum=${pageNum}&text=${selectedStr}`, true);
        XHR.send();
        window.location.reload();
      }
    }
  });

  // ハイライトの削除
  $(document).on('click', '.highlight-text', function(){
    let clickedStr = $(this).text();
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/highlights/delete?book_id=${bookId}&pagenum=${pageNum}&text=${clickedStr}`, true);
    XHR.send();
    window.location.reload();
  });
};

window.addEventListener("load", highlight);


