const highlight = () => {

  // 本とページ数を取得
  const url = location.href;
  const result = url.match("books/([0-9]+)/pages/([0-9]+)")
  const bookId = result[1]
  const pageNum = result[2]

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
      const txt = $('.page-text-content').html();
      $('.page-text-content').html(
        txt.replaceAll(item[i],
            `<span style="background-color:#FFF450", class="highlight-text">${item[i]}<a href="/books/${bookId}/pages/${pageNum}/search?search=${item[i]}", class="search-btn">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AA
            ADy0lEQVRYR7WWXWgcVRTH/2e29MEv9EHrB4hYPyCyd1Mtmp1pbFXwQYmo2TttqS/2xRerFPoQFTEB
            jYrogx8PKmKEFurMVqF99KNVuzdRWrozixbtgh8PjRURNYKQZubITDKbmc3M7mTN3re55+t3zz3nzi
            F0Wbrllpl4hEBbQdgAxgYA8wScYaAJn5u+70/N7Nz0UzdfaXLKMjJsZ5gZT4JoNIfjPwmYYvY+UOam
            eg79lkoqgG43XgD46dU4iunuVlK8n9d2BYBhOceZyIg7IOBXAHWQVmf2nEBGVCiB/UEAgwxcmdAnvF
            SriKfyQCQAdNs9A+CGNsPnlRTPdnJm2M4rDNqX0GE6pMxipRtEC0C33dcB7IkMGDi5Tls38tXowGw3
            J4G8bNVvJ2iHw0JdXmNKipc72YcAYcGBvowUCfi4JsXDeQK36+i2ew7AFUv7c+DCncq8JbMwQwDdcq
            rxar+AL7z0U3PjX70AlC23SAS3dRiiI7VK8YEsXzR00LlVK9DJZQPsqVXEm70Ej2zKljtGhBejb4+o
            9HWl2IJKFGzZqo8RaZHyb0qK+B32zBG/CiY8Pl0Rb6U5I912a8EtLAk/V1Lc03PUmKFuu58BuDvYYu
            DYtBR3pQNU3SYYG5eEbygpnlgjgOWuYv5BmaWbszIwB+CiQEjAIzUpDqwFgGG7uxjYH3WDkuKSLIC/
            AVzcZ4CzSopr0gEs53sQ3dTPK6AOrUhl2z1KwLZ+FiF8nlDbS+OpGShXG7uJ+b0lYV/aUGNsPm6K1l
            uTeAe2WCeu9Wn9z8ubtE/J4qv/pxD1D51xaPRc6INwWlXEQOZLGAiMauMwM49ESgvM139jln7sBWLI
            PrVNQ+Fo7ECTShaf6Qiw0ghNJcWNvQDotssxu3nfOz84s+O20x0BAmEibYvaC0TYm/e/YNiNSQa3DS
            E0rmRxotNBEgOJYbsfMfBQokiIjmDBn6ztKM2kOTIOOkNc0CYAvjcpTwbXq+7b8Hi2vRtWjGQpmVj0
            Swim3mPw8UX4rWErgvZlXLcSLBm8bLuSACvUYzyqTDEV2aQPpVbjfhC/A+DqVdbBPEBB0bXSvuWAe5
            m/Hn/E/TBgTkthL54rY4WDBfNoq506kzQBsnxvfn+84Iaqzh0aU+rVRRCZAPF4QQo1QPrA5WH2ieYY
            PAumswx8Mi2Lqp3PqLp7mfFaNjf/68O/LxfAaq5h+NB3V3kL5x/LmTm15gABbMq7knWGf/oCkB+Cfu
            kbQB4IAuy+AnSDUFJQ3wECiGHr2wGPvHcBCBB+B8NRUjwYyP4Dkrl9Q5viKrwAAAAASUVORK5CYII="></a></span>`
        )
      );
    }  
  }

  // ハイライトの追加
  $('.page-text-content').on('mouseup', function(){
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
    console.log(clickedStr)
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/highlights/delete?book_id=${bookId}&pagenum=${pageNum}&text=${clickedStr}`, true);
    XHR.send();
    window.location.reload();
  });
};

window.addEventListener("load", highlight);


