/**
 * Alertify
 * An unobtrusive customizable JavaScript notification system
 *
 * @author Fabien Doiron <fabien.doiron@gmail.com>
 * @copyright Fabien Doiron 2012
 * @license The MIT License (MIT) <http://opensource.org/licenses/mit-license.php>
 * @link http://www.github.com/fabien-d
 * @module Alertify
 * @version 0.1a1
 */
/*global define*/
(function(e,t){"use strict";var n=e.document,r;r=function(){var r,i,s,o,u,a,f,l,c,h,p,d,v,m,g,y,b,w,E,S,x,T;return g={buttons:{holder:'<nav class="alertify-buttons">{{buttons}}</nav>',ok:'<a href="#" class="alertify-button alertify-button-ok" id="aOK">{{ok}}</a>',cancel:'<a href="#" class="alertify-button alertify-button-cancel" id="aCancel">{{cancel}}</a>'},input:'<input type="text" class="alertify-text" id="aText">',message:'<p class="alertify-message">{{message}}</p>',log:'<article class="alertify-log{{class}}">{{message}}</article>'},y=5e3,E={ENTER:13,ESC:27},S={ok:"OK",cancel:"Cancel"},T=[],w=!1,r=function(e){return n.getElementById(e)},i=function(e){var i=r("aOK")||t,o=r("aCancel")||t,u=r("aText")||t,f=typeof i!="undefined",l=typeof o!="undefined",c="",p,d,v,m;p=function(t){v(t),typeof u!="undefined"&&(c=u.value),typeof e=="function"&&e(!0,c),typeof t.preventDefault!="undefined"&&t.preventDefault()},d=function(t){v(t),typeof e=="function"&&e(!1),typeof t.preventDefault!="undefined"&&t.preventDefault()},v=function(e){a(),h(n.body,"keyup",m)},m=function(e){var t=e.keyCode;t===E.ENTER&&f?p(e):t===E.ESC&&l&&d(e)},f&&s(i,"click",p),l&&s(o,"click",d),n.activeElement.blur(),s(n.body,"keyup",m)},s=function(e,t,n){typeof e.addEventListener=="function"?e.addEventListener(t,n,!1):e.attachEvent&&e.attachEvent("on"+t,n)},o=function(e){var t="",n=e.type,r=e.message;t+='<div class="alertify-dialog">',t+='<article class="alertify-inner">',t+=g.message.replace("{{message}}",r),n==="prompt"&&(t+=g.input),t+=g.buttons.holder,t+="</article>",t+="</div>";switch(n){case"confirm":case"prompt":t=t.replace("{{buttons}}",g.buttons.cancel+g.buttons.ok),t=t.replace("{{ok}}",S.ok).replace("{{cancel}}",S.cancel);break;case"alert":t=t.replace("{{buttons}}",g.buttons.ok),t=t.replace("{{ok}}",S.ok);break;default:}return b.className="alertify alertify-show alertify-"+n,m.className="alertify-cover",t},u=function(){setTimeout(function(){var e=x.childNodes[x.childNodes.length-1];typeof e!="undefined"&&x.removeChild(e)},y)},a=function(){T.splice(0,1),T.length>0?c():(w=!1,b.className="alertify alertify-hide alertify-hidden",m.className="alertify-cover alertify-hidden")},f=function(){n.createElement("nav"),n.createElement("article"),n.createElement("section"),m=n.createElement("div"),m.setAttribute("id","alertifycover"),m.className="alertify-cover alertify-hidden",n.body.appendChild(m),b=n.createElement("section"),b.setAttribute("id","alertify"),b.className="alertify alertify-hidden",n.body.appendChild(b),x=n.createElement("section"),x.setAttribute("id","alertifylogs"),x.className="alertify-logs",n.body.appendChild(x)},l=function(e,t){var r=n.createElement("article");r.className="alertify-log"+(typeof t=="string"&&t!==""?" alertify-log-"+t:""),r.innerHTML=e,x.insertBefore(r,x.firstChild),setTimeout(function(){r.className=r.className+" alertify-log-show"},50),u()},c=function(){var t=T[0];w=!0,b.innerHTML=o(t),i(t.callback),t.type==="prompt"&&e.setTimeout(function(){n.getElementById("aText").focus()},0)},h=function(e,t,n){typeof e.removeEventListener=="function"?e.removeEventListener(t,n,!1):e.detachEvent&&e.detachEvent("on"+t,n)},p=function(e,t,n){if(typeof e!="string")throw new Error("message must be a string");if(typeof t!="string")throw new Error("type must be a string");if(typeof n!="undefined"&&typeof n!="function")throw new Error("fn must be a function");return T.push({type:t,message:e,callback:n}),w||c(),this},d=function(e){return function(t){v(t,e)}},v=function(e,t){return l(e,t),this},f(),{alert:function(e,t){return p(e,"alert",t),this},confirm:function(e,t){return p(e,"confirm",t),this},extend:d,log:v,prompt:function(e,t){return p(e,"prompt",t),this},success:function(e){return v(e,"success"),this},error:function(e){return v(e,"error"),this},delay:y,labels:S}},typeof define=="function"?define([],function(){return new r}):typeof e.alertify=="undefined"&&(e.alertify=new r)})(this);