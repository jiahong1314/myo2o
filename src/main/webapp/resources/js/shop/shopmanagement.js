$(function() {
    var shopId = getQueryString('shopId');
    var shopInfoUrl = '/myo2o_war/shopadmin/getshopmanagementinfo?shopId=' + shopId;
    $.getJSON(shopInfoUrl,function (data) {
        if (data.redirect) {
            window.location.href = data.url;
        } else {
            if (data.shopId != undefined && data.shopId != null) {
                shopId = data.shopId;
            }
            $('#shopInfo').attr('href','/myo2o_war/shopadmin/shopoperation?shopId=' + shopId);
        }
    });
});