// サムネイルスライダー
document.addEventListener("turbolinks:load", function () {
  var slider = "#slider";
  var thumbnailProduct = "#thumb .product_s-img";

  $(thumbnailProduct).each(function () {
    var index = $(thumbnailProduct).index(this);
    $(this).attr("data-index", index);
  });

  // スライダー初期化後、カレントのサムネイル画像にクラス「thumbnail-current」を付ける
  // 「slickスライダー作成」の前にこの記述書く。
  $(slider).on('init', function (slick) {
    var index = $(".slide-product.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailProduct + '[data-index="' + index + '"]').addClass("thumbnail-current");
  });

  //slickスライダー初期化
  $(slider).slick({
    autoplay: false,
    arrows: false,
  });
  //サムネイル画像アイテムをクリックしたときにスライダー切り替え
  $(thumbnailProduct).on('mouseover', function () {
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo", index, false);
  });

  //サムネイル画像のカレントを切り替え
  $(slider).on('beforeChange', function (event, slick, currentSlide, nextSlide) {
    $(thumbnailProduct).each(function () {
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailProduct + '[data-index="' + nextSlide + '"]').addClass("thumbnail-current");
  });

  //サムネイル画像の透明度
  $(".product_s-img").fadeTo(0, 0.5); // 初期値：透明度30%
  $(".product_s-img").hover(
    function () {
      $(this).stop().fadeTo("4000", 1.0); // マウスオーバーで透明度を100%にする
    },
    function () {
      $(this).stop().fadeTo("4000", 0.5); // マウスアウトで透明度を30%に戻す
    }
  );
});

//product_show 削除btnのモーダル
$(document).on("turbolinks:load", function() {
  var modalOpen = $("#btn-delete");
  var modalMask = $("#product__mask");
  var modalWindow = $("#modal");
  var modalClose = $("#btn-delete-modal");

  modalOpen.click(function() {
    modalMask.fadeIn();
    modalWindow.fadeIn();
    "body".css("overflow", "hidden");
  });
  modalClose.click(function() {
    modalMask.fadeOut();
    modalWindow.fadeOut();
    $("body").css("overflow", "auto");
  });
});
