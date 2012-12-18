$(function(){
    $('#b1').click(b1);
    $('#b2').click(b2);
    $('#b3').click(b3);
    $('#b4').click(b4);
});

function b1()
{
    alertify.confirm( "Sign in with Twitter or Facebook", function () {
        $('h1').text('we rule and you suck!');
    });
}



function b2()
{
    alertify.log( "hey", "type" );
}

function b3()
{
    alertify.success( "Thanks for the comment!" );
}

function b4()
{
    alertify.success( "Thanks for the rating!" );
}