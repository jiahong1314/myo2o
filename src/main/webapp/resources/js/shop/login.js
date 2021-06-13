$(function (){

     var  loginUrl ='/myo2o_war/shopadmin/login' ;
    $('#submit').click(function () {

        var owner = {};
        owner.userName = $('#owner-username').val();
        owner.password = $('#owner-password').val();
        var formData = new FormData();
        formData.append('ownerStr', JSON.stringify(owner));
        var verifyCodeActual = $('#j_captcha').val();
        if (!verifyCodeActual) {
            $.toast('请输入验证码！');
        }
        formData.append('verifyCodeActual', verifyCodeActual);
        $.ajax({
            url: loginUrl,
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            cache: false,
            success: function (data) {
                if (data.success) {
                    $.toast('提交成功！');
                    window.location.href = '/myo2o_war/shopadmin/shoplist';
                } else {
                    $.toast('提交失败！' + data.errMsg);

                }
                $('#captcha_img').click();
            }
        });
    });
})