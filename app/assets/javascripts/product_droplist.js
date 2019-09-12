document.addEventListener("turbolinks:load", function() {
  // ドロップリストの選択肢をjsonデータからhtmlにする関数
  var firstSelecthtml = `<option value=" ">---</option>`;
  // edit時、登録したものを表示するためのHTML
  function foamHtml_select(search_result) {
    var html = `<option value="${search_result.id}" selected>${
      search_result.name
    }</option>`;
    return html;
  }
  function foamHtml(search_result) {
    var html = `<option value="${search_result.id}">${
      search_result.name
    }</option>`;
    return html;
  }

  // edit用　画面遷移時に登録したカテゴリー等の表示
  $(window).on("turbolinks:load", function() {
    // 子カテゴリーの表示
    var parent_id = $(".parent_id").val();
    if (parent_id === "---") {
      $(".child_id")
        .parent()
        .css("display", "none");
      $(".grandchild_id")
        .parent()
        .css("display", "none");
    } else {
      $.ajax({
        type: "GET",
        url: "/products/search_category",
        data: { parent_id: parent_id },
        dataType: "json"
      }).done(function(child_ids) {
        $(".child_id").empty();
        $(".child_id")
          .parent()
          // display:noneの解除
          .css("display", "");
        $(".grandchild_id")
          .parent()
          .css("display", "none");
        $(".child_id").append(firstSelecthtml);

        // 子カテゴリーのカスタムデータ属性の取得
        var product_catgory_child_id = $(".child_id").data(
          "product_catgory_child_id"
        );

        child_ids.forEach(function(child) {
          // edit時、登録した子カテゴリーを表示するための条件分岐
          if (product_catgory_child_id == child.id) {
            var html = foamHtml_select(child);
            $(".child_id").append(html);
          } else {
            var html = foamHtml(child);
            $(".child_id").append(html);
          }
        });
      });
    }

    // 孫カテゴリーの表示
    var parent_id = $(".edit_product .child_id").data("product_catgory_child_id");
    if (parent_id === "---") {
      $(".edit_product .grandchild_id")
        .parent()
        .css("display", "none");
      $(".edit_product .product__detail__form_box__size").css("display", "none");
    } else {
      $.ajax({
        type: "GET",
        url: "/products/search_category",
        data: { parent_id: parent_id },
        dataType: "json"
      }).done(function(child_ids) {
        $(".edit_product .grandchild_id").empty();
        $(".edit_product .grandchild_id").append(firstSelecthtml);
        $(".edit_product .grandchild_id")
          .parent()
          .css("display", "");
        if (child_ids.length == 1) {
          $(".edit_product .grandchild_id").empty();
          $(".edit_product .grandchild_id")
            .parent()
            .css("display", "none");
        }

        // 孫カテゴリーのカスタムデータ属性の取得
        var product_catgory_grandchild_id = $(".edit_product .grandchild_id").data(
          "product_catgory_grandchild_id"
        );
        child_ids.forEach(function(child) {
          // edit時、登録した孫カテゴリーを表示するための条件分岐
          if (product_catgory_grandchild_id == child.id) {
            var html = foamHtml_select(child);
            $(".edit_product .grandchild_id").append(html);
          } else {
            var html = foamHtml(child);
            $(".edit_product .grandchild_id").append(html);
          }
        });
      });
    }

    // サイズの表示
    var parent_id = $(".edit_product .grandchild_id").data(
      "product_catgory_grandchild_id"
    );
    if (parent_id === "---") {
      $(".edit_product .size_id").empty();
      $(".edit_product .size_id").append(firstSelecthtml);
    } else {
      $.ajax({
        type: "GET",
        url: "/products/search_category",
        data: { parent_id: parent_id },
        dataType: "json"
      }).done(function(size_ids) {
        $(".edit_product .size_id").empty();
        $(".edit_product .size_id").append(firstSelecthtml);
        $(".edit_product .product__detail__form_box__size").css("display", "");
        $(".edit_product .product__detail__form_box__brand").css("display", "");
        // size_idsが１つの時はサイズがない時なので場合分け
        if (size_ids.length == 1) {
          $(".edit_product .size_id").empty();
          $(".edit_product .product__detail__form_box__size").css("display", "none");
        }
        // サイズカテゴリーのカスタムデータ属性の取得
        var product_size_id = $(".edit_product .size_id").data("product_size_id");
        size_ids.forEach(function(size) {
          // edit時、登録したサイズカテゴリーを表示するための条件分岐
          if (product_size_id == size.id) {
            var html = foamHtml_select(size);
            $(".edit_product .size_id").append(html);
          } else {
            var html = foamHtml(size);
            $(".edit_product .size_id").append(html);
          }
        });
      });
    }

    // 配送方法の表示
    var fee_payer = $("#product_shipping_fee_payer").val();
    $("#product_delivery_method").empty();
    $("#product_delivery_method").append(firstSelecthtml);
    if (fee_payer == "---") {
      $(".root-of-delivery_method-for-css").attr(
        "style",
        "display: none !important;"
      );
    } else if (fee_payer == "送料込み（出品者負担）") {
      $(".root-of-delivery_method-for-css").css("display", "");
      delivery_methods = [
        "未定",
        "らくらくメルカリ便",
        "ゆうメール",
        "レターパック",
        "普通郵便(定形、定形外)",
        "クロネコヤマト",
        "ゆうパック",
        "クリックポスト",
        "ゆうパケット"
      ];
      delivery_methods.forEach(function(delively_method) {
        if (delively_method == gon.product.delivery_method) {
          var html = `<option value="${delively_method}" selected>${delively_method}</option>`;
          $("#product_delivery_method").append(html);
        } else {
          var html = `<option value="${delively_method}">${delively_method}</option>`;
          $("#product_delivery_method").append(html);
        }
      });
    } else if (fee_payer == "着払い（購入者負担）") {
      $(".root-of-delivery_method-for-css").css("display", "");

      delivery_methods = [
        "未定",
        "クロネコヤマト",
        "ゆうパック",
        "ゆうメール",
        "ゆうパック"
      ];
      delivery_methods.forEach(function(delively_method) {
        if (delively_method == gon.product.delivery_method) {
          var html = `<option value="${delively_method}" selected>${delively_method}</option>`;
          $("#product_delivery_method").append(html);
        } else {
          var html = `<option value="${delively_method}">${delively_method}</option>`;
          $("#product_delivery_method").append(html);
        }
      });
    }
  });

  $(function() {
    // 初期設定：後から出てくるドロップダウンリストをdisplay：noneで隠す
    $(".new_product .child_id")
      .parent()
      .css("display", "none");
    $(".new_product .grandchild_id")
      .parent()
      .css("display", "none");
    $(".new_product .product__detail__form_box__size").css("display", "none");
    $(".new_product .product__detail__form_box__brand").css("display", "none");
    $(".new_product .root-of-delivery_method-for-css").css("display", "none");

    // 親カテゴリーが入力されたとき子カテゴリーを生成
    $(".parent_id").change(function() {
      var parent_id = $(".parent_id").val();
      if (parent_id === "---") {
        $(".child_id")
          .parent()
          .css("display", "none");
        $(".grandchild_id")
          .parent()
          .css("display", "none");
        $(".grandchild_id")
          .val(" ");
      } else {
        $.ajax({
          type: "GET",
          url: "/products/search_category",
          data: { parent_id: parent_id },
          dataType: "json"
        }).done(function(child_ids) {
          $(".child_id").empty();
          $(".child_id")
            .parent()
            // display:noneの解除
            .css("display", "");
          $(".grandchild_id")
            .parent()
            .css("display", "none");
          $(".child_id").append(firstSelecthtml);
          child_ids.forEach(function(child) {
            var html = foamHtml(child);
            $(".child_id").append(html);
          });
        });
      }
    });

    // 子カテゴリーが入力されたとき孫カテゴリーを生成
    $(".child_id").change(function() {
      var parent_id = $(".child_id").val();
      if (parent_id === " ") {
        $(".grandchild_id")
          .parent()
          .css("display", "none");
        $(".grandchild_id")
          .val(" ");
        $(".product__detail__form_box__size").css("display", "none");
      } else {
        $.ajax({
          type: "GET",
          url: "/products/search_category",
          data: { parent_id: parent_id },
          dataType: "json"
        }).done(function(child_ids) {
          $(".grandchild_id").empty();
          $(".grandchild_id").append(firstSelecthtml);
          $(".grandchild_id")
            .parent()
            .css("display", "");
          if (child_ids.length == 1) {
            $(".grandchild_id").empty();
            $(".grandchild_id")
              .parent()
              .css("display", "none");
          }
          child_ids.forEach(function(child) {
            var html = foamHtml(child);
            $(".grandchild_id").append(html);
          });
        });
      }
    });

    // 孫カテゴリーが入力されたときサイズカテゴリーを生成
    $(".grandchild_id").change(function() {
      var parent_id = $(".grandchild_id").val();
      if (parent_id === " ") {
        $(".size_id").empty();
        $(".size_id").append(firstSelecthtml);
      } else {
        $.ajax({
          type: "GET",
          url: "/products/search_category",
          data: { parent_id: parent_id },
          dataType: "json"
        }).done(function(size_ids) {
          $(".size_id").empty();
          $(".size_id").append(firstSelecthtml);
          $(".product__detail__form_box__size").css("display", "");
          $(".product__detail__form_box__brand").css("display", "");
          // size_idsが１の時はサイズがない時なので場合分け
          if (size_ids.length == 1) {
            $(".size_id").empty();
            $(".product__detail__form_box__size").css("display", "none");
          }
          size_ids.forEach(function(size) {
            var html = foamHtml(size);
            $(".size_id").append(html);
          });
        });
      }
    });

    // 配送料の支払い元が確定した時点で配送方法のドロップダウンリストを生成
    $("#product_shipping_fee_payer").change(function() {
      var fee_payer = $("#product_shipping_fee_payer").val();
      $("#product_delivery_method").empty();
      $("#product_delivery_method").append(firstSelecthtml);
      if (fee_payer == " ") {
        $(".root-of-delivery_method-for-css").attr(
          "style",
          "display: none !important;"
        );
      } else if (fee_payer == "送料込み（出品者負担）") {
        $(".root-of-delivery_method-for-css").css("display", "");
        $("#product_delivery_method").append(
          ' <option value="未定">未定</option>\
            <option value="らくらくメルカリ便">らくらくメルカリ便</option>\
            <option value="ゆうメール">ゆうメール</option>\
            <option value="レターパック">レターパック</option>\
            <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>\
            <option value="クロネコヤマト">クロネコヤマト</option>\
            <option value="ゆうパック">ゆうパック</option>\
            <option value="クリックポスト">クリックポスト</option>\
            <option value="ゆうパケット">ゆうパケット</option>'
        );
      } else if (fee_payer == "着払い（購入者負担）") {
        $(".root-of-delivery_method-for-css").css("display", "");
        $("#product_delivery_method").append(
          ' <option value="未定">未定</option>\
            <option value="クロネコヤマト">クロネコヤマト</option>\
            <option value="ゆうパック">ゆうパック</option>\
            <option value="ゆうメール">ゆうメール</option>\
            <option value="ゆうパック">ゆうパック</option>'
        );
      }
    });

    // ３桁区切りにする
    function separate(num) {
      return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

    // 購入金額から手数料を計算する関数
    $(".sell-price__text_area_2").on("keyup", function() {
      var input = $(".sell-price__text_area_2").val();
      var fee = parseInt(input / 10);
      var separate_fee = separate(fee);
      var separate_profit = separate(input - fee);
      if (isNaN(fee) == false && input >= 300 && input <= 9999999) {
        $(".mercari-share").val("¥" + separate_fee);
        $(".seller-share").val("¥" + separate_profit);
      } else {
        $(".mercari-share").val("-");
        $(".seller-share").val("-");
      }
    });
  });
});

document.addEventListener("turbolinks:load", function() {
  $("#product_brand_id").autocomplete({
    autoFocus: true,
    source: "/products/auto_complete.json",
    minLength: 1,
    delay: 0
  });
});
