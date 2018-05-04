// Initialize app
var myApp = new Framework7();


// If we need to use custom DOM library, let's save it to $$ variable:
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {
    // Because we want to use dynamic navbar, we need to enable it for this view:
    dynamicNavbar: true
});

// Handle Cordova Device Ready Event
$$(document).on('deviceready', function() {
    console.log("Device is ready!");
});

var swiper = myApp.swiper.create('.swiper-container', {
  speed: 400,
  spaceBetween: 100
});


// Option 2. Using one 'pageInit' event handler for all pages:
$$(document).on('pageInit', function (e) {
    // Get page data from event data
    var page = e.detail.page;

    // This part handles the chatroom
    if (page.name === 'chatWithDoctor') {
      //console.log('Chat Room screen');
        Init();     
    }

    if (page.name === 'about') {
        myApp.alert('About screen');
    }

    if (page.name === 'profile') {
      myApp.alert('Profile screen');
    }

    if (page.name === 'doctor_note') {
      myApp.alert('Doctors Note screen');
    }

    if (page.name === 'health_insurance') {
      myApp.alert('Health Insurance screen');
    }

    if (page.name === 'health_tip') {
      myApp.alert('Health Tip screen');
    }

    if (page.name === 'patient_home') {
      myApp.alert('Patient Home screen');
    }

    if (page.name === 'patient_signUp') {
      myApp.alert('Patient SignUp screen');
    }

    if (page.name === 'payment_snscription') {
      myApp.alert('Payment & Subscription screen');
    }

})


function Init()
{
      //alert("Init");
      if(device.platform=="Android")
      {
        CCCometChat.getInstance(function success(data){ alert("success "+data); },function error(data){ alert(" fail "+data); });
        CCCometChat.initializeCometChat("","","","YES",function success(data){ Login(); },function error(data){ alert(" fail "+data); });
        //CCCometChat.initializeCometChat("SITE-URL","LICENSE-KEY","API-KEY","isCOMETONDEMAND",function success(data){ Login(); },function error(data){ alert(" fail "+data); });
      }
      else if(device.platform=="iOS")
      {
        CCCometChat.initializeCometChat("","","","YES",function success(){ Login() },function error(data){ alert(" fail "+data); });
        //CCCometChat.initializeCometChat("SITE-URL","LICENSE-KEY","API-KEY","isCOMETONDEMAND",function success(data){ alert(" success "+data); },function error(data){ alert(" fail "+data); });
      }

}
  
function Login()
{
      if(device.platform=="Android")
      {
          //alert("Login Android");
          //CCCometChat.login("USERNAME","PASSWORD",function success(data){ alert(" success "+data); },function error(data){ alert(" fail "+data); });
            CCCometChat.loginWithId("1", function success(data){ 
              CCCometChat.launchCometChat("YES", function success(data){ 
                  CCCometChat.launchCometChatWithID("YES","12","YES","YES", function success(data){  },function error(data){  });
              },function error(data){ 
                  alert('error'+ data);  
              });
          },function error(data){ 
          alert('error'+ data);
        });
        
      }else if(device.platform=="iOS"){
          //alert("Login iOS");
          //CCCometChat.login("USERNAME","PASSWORD",function success(data){ alert(" success "+data); },function error(data){ alert(" fail "+data); });
          CCCometChat.loginWithId("1", function success(data){ 
                CCCometChat.launchCometChat("YES", function success(data){ 
                    CCCometChat.launchCometChatWithID("YES","12","YES","YES", function success(data){  },function error(data){  });
                },function error(data){ 
                    alert('error'+ data);  
                });
            },function error(data){ 
            alert('error'+ data);
          });
      }
}
