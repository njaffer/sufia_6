!function(a,b){"use strict";function c(a,b){for(var c,d=[],g=0;g<a.length;++g){if(c=f[a[g]]||e(a[g]),!c)throw"module definition dependecy not found: "+a[g];d.push(c)}b.apply(null,d)}function d(a,d,e){if("string"!=typeof a)throw"invalid module definition, module id must be defined and be a string";if(d===b)throw"invalid module definition, dependencies must be specified";if(e===b)throw"invalid module definition, definition function must be specified";c(d,function(){f[a]=e.apply(null,arguments)})}function e(b){for(var c=a,d=b.split(/[.\/]/),e=0;e<d.length;++e){if(!c[d[e]])return;c=c[d[e]]}return c}var f={};d("tinymce/tableplugin/Utils",["tinymce/Env"],function(a){function b(a,b){return parseInt(a.getAttribute(b)||1,10)}function c(b){(!a.ie||a.ie>10)&&(b.innerHTML='<br data-mce-bogus="1" />')}return{getSpanVal:b,paddCell:c}}),d("tinymce/tableplugin/TableGrid",["tinymce/util/Tools","tinymce/Env","tinymce/tableplugin/Utils"],function(a,c,d){var e=a.each,f=d.getSpanVal;return function(g,h){function i(){var a=0;G=[],H=0,e(["thead","tbody","tfoot"],function(b){var c=M.select("> "+b+" tr",h);e(c,function(c,d){d+=a,e(M.select("> td, > th",c),function(a,c){var e,g,h,i;if(G[d])for(;G[d][c];)c++;for(h=f(a,"rowspan"),i=f(a,"colspan"),g=d;d+h>g;g++)for(G[g]||(G[g]=[]),e=c;c+i>e;e++)G[g][e]={part:b,real:g==d&&e==c,elm:a,rowspan:h,colspan:i};H=Math.max(H,c+1)})}),a+=c.length})}function j(a,b){return a=a.cloneNode(b),a.removeAttribute("id"),a}function k(a,b){var c;return c=G[b],c?c[a]:void 0}function l(a,b,c){a&&(c=parseInt(c,10),1===c?a.removeAttribute(b,1):a.setAttribute(b,c,1))}function m(a){return a&&(M.hasClass(a.elm,"mce-item-selected")||a==K)}function n(){var a=[];return e(h.rows,function(b){e(b.cells,function(c){return M.hasClass(c,"mce-item-selected")||K&&c==K.elm?(a.push(b),!1):void 0})}),a}function o(){var a=M.createRng();a.setStartAfter(h),a.setEndAfter(h),L.setRng(a),M.remove(h)}function p(b){var f,h={};return g.settings.table_clone_elements!==!1&&(h=a.makeMap((g.settings.table_clone_elements||"strong em b i span font h1 h2 h3 h4 h5 h6 p div").toUpperCase(),/[ ,]/)),a.walk(b,function(a){var d;return 3==a.nodeType?(e(M.getParents(a.parentNode,null,b).reverse(),function(a){h[a.nodeName]&&(a=j(a,!1),f?d&&d.appendChild(a):f=d=a,d=a)}),d&&(d.innerHTML=c.ie?"&nbsp;":'<br data-mce-bogus="1" />'),!1):void 0},"childNodes"),b=j(b,!1),l(b,"rowSpan",1),l(b,"colSpan",1),f?b.appendChild(f):d.paddCell(b),b}function q(){var a,b=M.createRng();return e(M.select("tr",h),function(a){0===a.cells.length&&M.remove(a)}),0===M.select("tr",h).length?(b.setStartBefore(h),b.setEndBefore(h),L.setRng(b),void M.remove(h)):(e(M.select("thead,tbody,tfoot",h),function(a){0===a.rows.length&&M.remove(a)}),i(),void(I&&(a=G[Math.min(G.length-1,I.y)],a&&(L.select(a[Math.min(a.length-1,I.x)].elm,!0),L.collapse(!0)))))}function r(a,b,c,d){var e,f,g,h,i;for(e=G[b][a].elm.parentNode,g=1;c>=g;g++)if(e=M.getNext(e,"tr")){for(f=a;f>=0;f--)if(i=G[b+g][f].elm,i.parentNode==e){for(h=1;d>=h;h++)M.insertAfter(p(i),i);break}if(-1==f)for(h=1;d>=h;h++)e.insertBefore(p(e.cells[0]),e.cells[0])}}function s(){e(G,function(a,b){e(a,function(a,c){var d,e,g;if(m(a)&&(a=a.elm,d=f(a,"colspan"),e=f(a,"rowspan"),d>1||e>1)){for(l(a,"rowSpan",1),l(a,"colSpan",1),g=0;d-1>g;g++)M.insertAfter(p(a),a);r(c,b,e-1,d)}})})}function t(b,c,d){var f,g,h,j,n,o,p,r,t,u,v;if(b?(f=B(b),g=f.x,h=f.y,j=g+(c-1),n=h+(d-1)):(I=J=null,e(G,function(a,b){e(a,function(a,c){m(a)&&(I||(I={x:c,y:b}),J={x:c,y:b})})}),I&&(g=I.x,h=I.y,j=J.x,n=J.y)),r=k(g,h),t=k(j,n),r&&t&&r.part==t.part){for(s(),i(),r=k(g,h).elm,l(r,"colSpan",j-g+1),l(r,"rowSpan",n-h+1),p=h;n>=p;p++)for(o=g;j>=o;o++)G[p]&&G[p][o]&&(b=G[p][o].elm,b!=r&&(u=a.grep(b.childNodes),e(u,function(a){r.appendChild(a)}),u.length&&(u=a.grep(r.childNodes),v=0,e(u,function(a){"BR"==a.nodeName&&M.getAttrib(a,"data-mce-bogus")&&v++<u.length-1&&r.removeChild(a)})),M.remove(b)));q()}}function u(a){var c,d,g,h,i,k,n,o,q;if(e(G,function(b,d){return e(b,function(b){return m(b)&&(b=b.elm,i=b.parentNode,k=j(i,!1),c=d,a)?!1:void 0}),a?!c:void 0}),c!==b){for(h=0;h<G[0].length;h++)if(G[c][h]&&(d=G[c][h].elm,d!=g)){if(a){if(c>0&&G[c-1][h]&&(o=G[c-1][h].elm,q=f(o,"rowSpan"),q>1)){l(o,"rowSpan",q+1);continue}}else if(q=f(d,"rowspan"),q>1){l(d,"rowSpan",q+1);continue}n=p(d),l(n,"colSpan",d.colSpan),k.appendChild(n),g=d}k.hasChildNodes()&&(a?i.parentNode.insertBefore(k,i):M.insertAfter(k,i))}}function v(a){var b,c;e(G,function(c){return e(c,function(c,d){return m(c)&&(b=d,a)?!1:void 0}),a?!b:void 0}),e(G,function(d,e){var g,h,i;d[b]&&(g=d[b].elm,g!=c&&(i=f(g,"colspan"),h=f(g,"rowspan"),1==i?a?(g.parentNode.insertBefore(p(g),g),r(b,e,h-1,i)):(M.insertAfter(p(g),g),r(b,e,h-1,i)):l(g,"colSpan",g.colSpan+1),c=g))})}function w(){var b=[];e(G,function(c){e(c,function(c,d){m(c)&&-1===a.inArray(b,d)&&(e(G,function(a){var b,c=a[d].elm;b=f(c,"colSpan"),b>1?l(c,"colSpan",b-1):M.remove(c)}),b.push(d))})}),q()}function x(){function a(a){var b,c;e(a.cells,function(a){var c=f(a,"rowSpan");c>1&&(l(a,"rowSpan",c-1),b=B(a),r(b.x,b.y,1,1))}),b=B(a.cells[0]),e(G[b.y],function(a){var b;a=a.elm,a!=c&&(b=f(a,"rowSpan"),1>=b?M.remove(a):l(a,"rowSpan",b-1),c=a)})}var b;b=n(),e(b.reverse(),function(b){a(b)}),q()}function y(){var a=n();return M.remove(a),q(),a}function z(){var a=n();return e(a,function(b,c){a[c]=j(b,!0)}),a}function A(a,b){var c=n(),d=c[b?0:c.length-1],f=d.cells.length;a&&(e(G,function(a){var b;return f=0,e(a,function(a){a.real&&(f+=a.colspan),a.elm.parentNode==d&&(b=1)}),b?!1:void 0}),b||a.reverse(),e(a,function(a){var c,e,g=a.cells.length;for(c=0;g>c;c++)e=a.cells[c],l(e,"colSpan",1),l(e,"rowSpan",1);for(c=g;f>c;c++)a.appendChild(p(a.cells[g-1]));for(c=f;g>c;c++)M.remove(a.cells[c]);b?d.parentNode.insertBefore(a,d):M.insertAfter(a,d)}),M.removeClass(M.select("td.mce-item-selected,th.mce-item-selected"),"mce-item-selected"))}function B(a){var b;return e(G,function(c,d){return e(c,function(c,e){return c.elm==a?(b={x:e,y:d},!1):void 0}),!b}),b}function C(a){I=B(a)}function D(){var a,b;return a=b=0,e(G,function(c,d){e(c,function(c,e){var f,g;m(c)&&(c=G[d][e],e>a&&(a=e),d>b&&(b=d),c.real&&(f=c.colspan-1,g=c.rowspan-1,f&&e+f>a&&(a=e+f),g&&d+g>b&&(b=d+g)))})}),{x:a,y:b}}function E(a){var b,c,d,e,f,g,h,i,j,k;if(J=B(a),I&&J){for(b=Math.min(I.x,J.x),c=Math.min(I.y,J.y),d=Math.max(I.x,J.x),e=Math.max(I.y,J.y),f=d,g=e,k=c;g>=k;k++)a=G[k][b],a.real||b-(a.colspan-1)<b&&(b-=a.colspan-1);for(j=b;f>=j;j++)a=G[c][j],a.real||c-(a.rowspan-1)<c&&(c-=a.rowspan-1);for(k=c;e>=k;k++)for(j=b;d>=j;j++)a=G[k][j],a.real&&(h=a.colspan-1,i=a.rowspan-1,h&&j+h>f&&(f=j+h),i&&k+i>g&&(g=k+i));for(M.removeClass(M.select("td.mce-item-selected,th.mce-item-selected"),"mce-item-selected"),k=c;g>=k;k++)for(j=b;f>=j;j++)G[k][j]&&M.addClass(G[k][j].elm,"mce-item-selected")}}function F(a,b){var c,d,e;c=B(a),d=c.y*H+c.x;do{if(d+=b,e=k(d%H,Math.floor(d/H)),!e)break;if(e.elm!=a)return L.select(e.elm,!0),M.isEmpty(e.elm)&&L.collapse(!0),!0}while(e.elm==a);return!1}var G,H,I,J,K,L=g.selection,M=L.dom;h=h||M.getParent(L.getStart(),"table"),i(),K=M.getParent(L.getStart(),"th,td"),K&&(I=B(K),J=D(),K=k(I.x,I.y)),a.extend(this,{deleteTable:o,split:s,merge:t,insertRow:u,insertCol:v,deleteCols:w,deleteRows:x,cutRows:y,copyRows:z,pasteRows:A,getPos:B,setStartCell:C,setEndCell:E,moveRelIdx:F,refresh:i})}}),d("tinymce/tableplugin/Quirks",["tinymce/util/VK","tinymce/Env","tinymce/util/Tools","tinymce/tableplugin/Utils"],function(a,b,c,d){var e=c.each,f=d.getSpanVal;return function(g){function h(){function b(b){function c(a,c){var e=a?"previousSibling":"nextSibling",f=g.dom.getParent(c,"tr"),h=f[e];if(h)return q(g,c,h,a),b.preventDefault(),!0;var k=g.dom.getParent(f,"table"),l=f.parentNode,m=l.nodeName.toLowerCase();if("tbody"===m||m===(a?"tfoot":"thead")){var n=d(a,k,l,"tbody");if(null!==n)return i(a,n,c)}return j(a,f,e,k)}function d(a,b,c,d){var e=g.dom.select(">"+d,b),f=e.indexOf(c);if(a&&0===f||!a&&f===e.length-1)return h(a,b);if(-1===f){var i="thead"===c.tagName.toLowerCase()?0:e.length-1;return e[i]}return e[f+(a?-1:1)]}function h(a,b){var c=a?"thead":"tfoot",d=g.dom.select(">"+c,b);return 0!==d.length?d[0]:null}function i(a,c,d){var e=k(c,a);return e&&q(g,d,e,a),b.preventDefault(),!0}function j(a,d,e,f){var h=f[e];if(h)return l(h),!0;var i=g.dom.getParent(f,"td,th");if(i)return c(a,i,b);var j=k(d,!a);return l(j),b.preventDefault(),!1}function k(a,b){var c=a&&a[b?"lastChild":"firstChild"];return c&&"BR"===c.nodeName?g.dom.getParent(c,"td,th"):c}function l(a){g.selection.setCursorLocation(a,0)}function m(){return t==a.UP||t==a.DOWN}function n(a){var b=a.selection.getNode(),c=a.dom.getParent(b,"tr");return null!==c}function o(a){for(var b=0,c=a;c.previousSibling;)c=c.previousSibling,b+=f(c,"colspan");return b}function p(a,b){var c=0,d=0;return e(a.children,function(a,e){return c+=f(a,"colspan"),d=e,c>b?!1:void 0}),d}function q(a,b,c,d){var e=o(g.dom.getParent(b,"td,th")),f=p(c,e),h=c.childNodes[f],i=k(h,d);l(i||h)}function r(a){var b=g.selection.getNode(),c=g.dom.getParent(b,"td,th"),d=g.dom.getParent(a,"td,th");return c&&c!==d&&s(c,d)}function s(a,b){return g.dom.getParent(a,"TABLE")===g.dom.getParent(b,"TABLE")}var t=b.keyCode;if(m()&&n(g)){var u=g.selection.getNode();setTimeout(function(){r(u)&&c(!b.shiftKey&&t===a.UP,u,b)},0)}}g.on("KeyDown",function(a){b(a)})}function i(){function a(a,b){var c,d=b.ownerDocument,e=d.createRange();return e.setStartBefore(b),e.setEnd(a.endContainer,a.endOffset),c=d.createElement("body"),c.appendChild(e.cloneContents()),0===c.innerHTML.replace(/<(br|img|object|embed|input|textarea)[^>]*>/gi,"-").replace(/<[^>]+>/g,"").length}g.on("KeyDown",function(b){var c,d,e=g.dom;(37==b.keyCode||38==b.keyCode)&&(c=g.selection.getRng(),d=e.getParent(c.startContainer,"table"),d&&g.getBody().firstChild==d&&a(c,d)&&(c=e.createRng(),c.setStartBefore(d),c.setEndBefore(d),g.selection.setRng(c),b.preventDefault()))})}function j(){g.on("KeyDown SetContent VisualAid",function(){var a;for(a=g.getBody().lastChild;a;a=a.previousSibling)if(3==a.nodeType){if(a.nodeValue.length>0)break}else if(1==a.nodeType&&("BR"==a.tagName||!a.getAttribute("data-mce-bogus")))break;a&&"TABLE"==a.nodeName&&(g.settings.forced_root_block?g.dom.add(g.getBody(),g.settings.forced_root_block,g.settings.forced_root_block_attrs,b.ie&&b.ie<11?"&nbsp;":'<br data-mce-bogus="1" />'):g.dom.add(g.getBody(),"br",{"data-mce-bogus":"1"}))}),g.on("PreProcess",function(a){var b=a.node.lastChild;b&&("BR"==b.nodeName||1==b.childNodes.length&&("BR"==b.firstChild.nodeName||"\xa0"==b.firstChild.nodeValue))&&b.previousSibling&&"TABLE"==b.previousSibling.nodeName&&g.dom.remove(b)})}function k(){function a(a,b,c,d){var e,f,g,h=3,i=a.dom.getParent(b.startContainer,"TABLE");return i&&(e=i.parentNode),f=b.startContainer.nodeType==h&&0===b.startOffset&&0===b.endOffset&&d&&("TR"==c.nodeName||c==e),g=("TD"==c.nodeName||"TH"==c.nodeName)&&!d,f||g}function b(){var b=g.selection.getRng(),c=g.selection.getNode(),d=g.dom.getParent(b.startContainer,"TD,TH");if(a(g,b,c,d)){d||(d=c);for(var e=d.lastChild;e.lastChild;)e=e.lastChild;3==e.nodeType&&(b.setEnd(e,e.data.length),g.selection.setRng(b))}}g.on("KeyDown",function(){b()}),g.on("MouseDown",function(a){2!=a.button&&b()})}function l(){function b(a){g.selection.select(a,!0),g.selection.collapse(!0)}function e(a){g.$(a).empty(),d.paddCell(a)}g.on("keydown",function(d){if((d.keyCode==a.DELETE||d.keyCode==a.BACKSPACE)&&!d.isDefaultPrevented()){var f,h,i,j;if(f=g.dom.getParent(g.selection.getStart(),"table")){if(h=g.dom.select("td,th",f),i=c.grep(h,function(a){return g.dom.hasClass(a,"mce-item-selected")}),0===i.length)return j=g.dom.getParent(g.selection.getStart(),"td,th"),void(g.selection.isCollapsed()&&j&&g.dom.isEmpty(j)&&(d.preventDefault(),e(j),b(j)));d.preventDefault(),h.length==i.length?g.execCommand("mceTableDelete"):(c.each(i,e),b(i[0]))}}})}l(),b.webkit&&(h(),k()),b.gecko&&(i(),j()),b.ie>10&&(i(),j())}}),d("tinymce/tableplugin/CellSelection",["tinymce/tableplugin/TableGrid","tinymce/dom/TreeWalker","tinymce/util/Tools"],function(a,b,c){return function(d){function e(a){d.getBody().style.webkitUserSelect="",(a||l)&&(d.dom.removeClass(d.dom.select("td.mce-item-selected,th.mce-item-selected"),"mce-item-selected"),l=!1)}function f(b){var c,e,f=b.target;if(!j&&h&&(g||f!=h)&&("TD"==f.nodeName||"TH"==f.nodeName)){e=k.getParent(f,"table"),e==i&&(g||(g=new a(d,e),g.setStartCell(h),d.getBody().style.webkitUserSelect="none"),g.setEndCell(f),l=!0),c=d.selection.getSel();try{c.removeAllRanges?c.removeAllRanges():c.empty()}catch(m){}b.preventDefault()}}var g,h,i,j,k=d.dom,l=!0;return d.on("MouseDown",function(a){2==a.button||j||(e(),h=k.getParent(a.target,"td,th"),i=k.getParent(h,"table"))}),d.on("mouseover",f),d.on("remove",function(){k.unbind(d.getDoc(),"mouseover",f)}),d.on("MouseUp",function(){function a(a,d){var f=new b(a,a);do{if(3==a.nodeType&&0!==c.trim(a.nodeValue).length)return void(d?e.setStart(a,0):e.setEnd(a,a.nodeValue.length));if("BR"==a.nodeName)return void(d?e.setStartBefore(a):e.setEndBefore(a))}while(a=d?f.next():f.prev())}var e,f,j,l,m,n=d.selection;if(h){if(g&&(d.getBody().style.webkitUserSelect=""),f=k.select("td.mce-item-selected,th.mce-item-selected"),f.length>0){e=k.createRng(),l=f[0],e.setStartBefore(l),e.setEndAfter(l),a(l,1),j=new b(l,k.getParent(f[0],"table"));do if("TD"==l.nodeName||"TH"==l.nodeName){if(!k.hasClass(l,"mce-item-selected"))break;m=l}while(l=j.next());a(m),n.setRng(e)}d.nodeChanged(),h=g=i=null}}),d.on("KeyUp Drop SetContent",function(a){e("setcontent"==a.type),h=g=i=null,j=!1}),d.on("ObjectResizeStart ObjectResized",function(a){j="objectresized"!=a.type}),{clear:e}}}),d("tinymce/tableplugin/Dialogs",["tinymce/util/Tools","tinymce/Env"],function(a,b){var c=a.each;return function(d){function e(){var a=d.settings.color_picker_callback;return a?function(){var b=this;a.call(d,function(a){b.value(a).fire("change")},b.value())}:void 0}function f(a){return{title:"Advanced",type:"form",defaults:{onchange:function(){l(a,this.parents().reverse()[0],"style"==this.name())}},items:[{label:"Style",name:"style",type:"textbox"},{type:"form",padding:0,formItemDefaults:{layout:"grid",alignH:["start","right"]},defaults:{size:7},items:[{label:"Border color",type:"colorbox",name:"borderColor",onaction:e()},{label:"Background color",type:"colorbox",name:"backgroundColor",onaction:e()}]}]}}function g(a){return a?a.replace(/px$/,""):""}function h(a){return/^[0-9]+$/.test(a)&&(a+="px"),a}function i(a){c("left center right".split(" "),function(b){d.formatter.remove("align"+b,{},a)})}function j(a){c("top middle bottom".split(" "),function(b){d.formatter.remove("valign"+b,{},a)})}function k(b,c,d){function e(b,d){return d=d||[],a.each(b,function(a){var b={text:a.text||a.title};a.menu?b.menu=e(a.menu):(b.value=a.value,c&&c(b)),d.push(b)}),d}return e(b,d||[])}function l(a,b,c){var d=b.toJSON(),e=a.parseStyle(d.style);c?(b.find("#borderColor").value(e["border-color"]||"")[0].fire("change"),b.find("#backgroundColor").value(e["background-color"]||"")[0].fire("change")):(e["border-color"]=d.borderColor,e["background-color"]=d.backgroundColor),b.find("#style").value(a.serializeStyle(a.parseStyle(a.serializeStyle(e))))}function m(a,b,c){var d=a.parseStyle(a.getAttrib(c,"style"));d["border-color"]&&(b.borderColor=d["border-color"]),d["background-color"]&&(b.backgroundColor=d["background-color"]),b.style=a.serializeStyle(d)}function n(a,b,d){var e=a.parseStyle(a.getAttrib(b,"style"));c(d,function(a){e[a.name]=a.value}),a.setAttrib(b,"style",a.serializeStyle(a.parseStyle(a.serializeStyle(e))))}var o=this;o.tableProps=function(){o.table(!0)},o.table=function(e){function j(){function c(a,b,d){if("TD"===a.tagName||"TH"===a.tagName)v.setStyle(a,b,d);else if(a.children)for(var e=0;e<a.children.length;e++)c(a.children[e],b,d)}var e;l(v,this),w=a.extend(w,this.toJSON()),w["class"]===!1&&delete w["class"],d.undoManager.transact(function(){if(p||(p=d.plugins.table.insertTable(w.cols||1,w.rows||1)),d.dom.setAttribs(p,{style:w.style,"class":w["class"]}),d.settings.table_style_by_css){if(u=[],u.push({name:"border",value:w.border}),u.push({name:"border-spacing",value:h(w.cellspacing)}),n(v,p,u),v.setAttribs(p,{"data-mce-border-color":w.borderColor,"data-mce-cell-padding":w.cellpadding,"data-mce-border":w.border}),p.children)for(var a=0;a<p.children.length;a++)c(p.children[a],"border",w.border),c(p.children[a],"padding",h(w.cellpadding))}else d.dom.setAttribs(p,{border:w.border,cellpadding:w.cellpadding,cellspacing:w.cellspacing});v.getAttrib(p,"width")&&!d.settings.table_style_by_css?v.setAttrib(p,"width",g(w.width)):v.setStyle(p,"width",h(w.width)),v.setStyle(p,"height",h(w.height)),e=v.select("caption",p)[0],e&&!w.caption&&v.remove(e),!e&&w.caption&&(e=v.create("caption"),e.innerHTML=b.ie?"\xa0":'<br data-mce-bogus="1"/>',p.insertBefore(e,p.firstChild)),i(p),w.align&&d.formatter.apply("align"+w.align,{},p),d.focus(),d.addVisual()})}function o(a,b){function c(a,c){for(var d=0;d<c.length;d++){var e=v.getStyle(c[d],b);if("undefined"==typeof a&&(a=e),a!=e)return""}return a}var e,f=d.dom.select("td,th",a);return e=c(e,f)}var p,q,r,s,t,u,v=d.dom,w={};e===!0?(p=v.getParent(d.selection.getStart(),"table"),p&&(w={width:g(v.getStyle(p,"width")||v.getAttrib(p,"width")),height:g(v.getStyle(p,"height")||v.getAttrib(p,"height")),cellspacing:g(v.getStyle(p,"border-spacing")||v.getAttrib(p,"cellspacing")),cellpadding:v.getAttrib(p,"data-mce-cell-padding")||v.getAttrib(p,"cellpadding")||o(p,"padding"),border:v.getAttrib(p,"data-mce-border")||v.getAttrib(p,"border")||o(p,"border"),borderColor:v.getAttrib(p,"data-mce-border-color"),caption:!!v.select("caption",p)[0],"class":v.getAttrib(p,"class")},c("left center right".split(" "),function(a){d.formatter.matchNode(p,"align"+a)&&(w.align=a)}))):(q={label:"Cols",name:"cols"},r={label:"Rows",name:"rows"}),d.settings.table_class_list&&(w["class"]&&(w["class"]=w["class"].replace(/\s*mce\-item\-table\s*/g,"")),s={name:"class",type:"listbox",label:"Class",values:k(d.settings.table_class_list,function(a){a.value&&(a.textStyle=function(){return d.formatter.getCssText({block:"table",classes:[a.value]})})})}),t={type:"form",layout:"flex",direction:"column",labelGapCalc:"children",padding:0,items:[{type:"form",labelGapCalc:!1,padding:0,layout:"grid",columns:2,defaults:{type:"textbox",maxWidth:50},items:d.settings.table_appearance_options!==!1?[q,r,{label:"Width",name:"width"},{label:"Height",name:"height"},{label:"Cell spacing",name:"cellspacing"},{label:"Cell padding",name:"cellpadding"},{label:"Border",name:"border"},{label:"Caption",name:"caption",type:"checkbox"}]:[q,r,{label:"Width",name:"width"},{label:"Height",name:"height"}]},{label:"Alignment",name:"align",type:"listbox",text:"None",values:[{text:"None",value:""},{text:"Left",value:"left"},{text:"Center",value:"center"},{text:"Right",value:"right"}]},s]},d.settings.table_advtab!==!1?(m(v,w,p),d.windowManager.open({title:"Table properties",data:w,bodyType:"tabpanel",body:[{title:"General",type:"form",items:t},f(v)],onsubmit:j})):d.windowManager.open({title:"Table properties",data:w,body:t,onsubmit:j})},o.merge=function(a,b){d.windowManager.open({title:"Merge cells",body:[{label:"Cols",name:"cols",type:"textbox",value:"1",size:10},{label:"Rows",name:"rows",type:"textbox",value:"1",size:10}],onsubmit:function(){var c=this.toJSON();d.undoManager.transact(function(){a.merge(b,c.cols,c.rows)})}})},o.cell=function(){function b(){l(p,this),n=a.extend(n,this.toJSON()),d.undoManager.transact(function(){c(q,function(a){d.dom.setAttribs(a,{scope:n.scope,style:n.style,"class":n["class"]}),d.dom.setStyles(a,{width:h(n.width),height:h(n.height)}),n.type&&a.nodeName.toLowerCase()!=n.type&&(a=p.rename(a,n.type)),i(a),n.align&&d.formatter.apply("align"+n.align,{},a),j(a),n.valign&&d.formatter.apply("valign"+n.valign,{},a)}),d.focus()})}var e,n,o,p=d.dom,q=[];if(q=d.dom.select("td.mce-item-selected,th.mce-item-selected"),e=d.dom.getParent(d.selection.getStart(),"td,th"),!q.length&&e&&q.push(e),e=e||q[0]){n={width:g(p.getStyle(e,"width")||p.getAttrib(e,"width")),height:g(p.getStyle(e,"height")||p.getAttrib(e,"height")),scope:p.getAttrib(e,"scope"),"class":p.getAttrib(e,"class")},n.type=e.nodeName.toLowerCase(),c("left center right".split(" "),function(a){d.formatter.matchNode(e,"align"+a)&&(n.align=a)}),c("top middle bottom".split(" "),function(a){d.formatter.matchNode(e,"valign"+a)&&(n.valign=a)}),d.settings.table_cell_class_list&&(o={name:"class",type:"listbox",label:"Class",values:k(d.settings.table_cell_class_list,function(a){a.value&&(a.textStyle=function(){return d.formatter.getCssText({block:"td",classes:[a.value]})})})});var r={type:"form",layout:"flex",direction:"column",labelGapCalc:"children",padding:0,items:[{type:"form",layout:"grid",columns:2,labelGapCalc:!1,padding:0,defaults:{type:"textbox",maxWidth:50},items:[{label:"Width",name:"width"},{label:"Height",name:"height"},{label:"Cell type",name:"type",type:"listbox",text:"None",minWidth:90,maxWidth:null,values:[{text:"Cell",value:"td"},{text:"Header cell",value:"th"}]},{label:"Scope",name:"scope",type:"listbox",text:"None",minWidth:90,maxWidth:null,values:[{text:"None",value:""},{text:"Row",value:"row"},{text:"Column",value:"col"},{text:"Row group",value:"rowgroup"},{text:"Column group",value:"colgroup"}]},{label:"H Align",name:"align",type:"listbox",text:"None",minWidth:90,maxWidth:null,values:[{text:"None",value:""},{text:"Left",value:"left"},{text:"Center",value:"center"},{text:"Right",value:"right"}]},{label:"V Align",name:"valign",type:"listbox",text:"None",minWidth:90,maxWidth:null,values:[{text:"None",value:""},{text:"Top",value:"top"},{text:"Middle",value:"middle"},{text:"Bottom",value:"bottom"}]}]},o]};d.settings.table_cell_advtab!==!1?(m(p,n,e),d.windowManager.open({title:"Cell properties",bodyType:"tabpanel",data:n,body:[{title:"General",type:"form",items:r},f(p)],onsubmit:b})):d.windowManager.open({title:"Cell properties",data:n,body:r,onsubmit:b})}},o.row=function(){function b(){var b,e,f;l(r,this),p=a.extend(p,this.toJSON()),d.undoManager.transact(function(){var a=p.type;c(s,function(c){d.dom.setAttribs(c,{scope:p.scope,style:p.style,"class":p["class"]}),d.dom.setStyles(c,{height:h(p.height)}),a!=c.parentNode.nodeName.toLowerCase()&&(b=r.getParent(c,"table"),e=c.parentNode,f=r.select(a,b)[0],f||(f=r.create(a),b.firstChild?b.insertBefore(f,b.firstChild):b.appendChild(f)),f.appendChild(c),e.hasChildNodes()||r.remove(e)),i(c),p.align&&d.formatter.apply("align"+p.align,{},c)}),d.focus()})}var e,j,n,o,p,q,r=d.dom,s=[];e=d.dom.getParent(d.selection.getStart(),"table"),j=d.dom.getParent(d.selection.getStart(),"td,th"),c(e.rows,function(a){c(a.cells,function(b){return r.hasClass(b,"mce-item-selected")||b==j?(s.push(a),!1):void 0})}),n=s[0],n&&(p={height:g(r.getStyle(n,"height")||r.getAttrib(n,"height")),scope:r.getAttrib(n,"scope"),"class":r.getAttrib(n,"class")},p.type=n.parentNode.nodeName.toLowerCase(),c("left center right".split(" "),function(a){d.formatter.matchNode(n,"align"+a)&&(p.align=a)}),d.settings.table_row_class_list&&(o={name:"class",type:"listbox",label:"Class",values:k(d.settings.table_row_class_list,function(a){a.value&&(a.textStyle=function(){return d.formatter.getCssText({block:"tr",classes:[a.value]})})})}),q={type:"form",columns:2,padding:0,defaults:{type:"textbox"},items:[{type:"listbox",name:"type",label:"Row type",text:"None",maxWidth:null,values:[{text:"Header",value:"thead"},{text:"Body",value:"tbody"},{text:"Footer",value:"tfoot"}]},{type:"listbox",name:"align",label:"Alignment",text:"None",maxWidth:null,values:[{text:"None",value:""},{text:"Left",value:"left"},{text:"Center",value:"center"},{text:"Right",value:"right"}]},{label:"Height",name:"height"},o]},d.settings.table_row_advtab!==!1?(m(r,p,n),d.windowManager.open({title:"Row properties",data:p,bodyType:"tabpanel",body:[{title:"General",type:"form",items:q},f(r)],onsubmit:b})):d.windowManager.open({title:"Row properties",data:p,body:q,onsubmit:b}))}}}),d("tinymce/tableplugin/Plugin",["tinymce/tableplugin/TableGrid","tinymce/tableplugin/Quirks","tinymce/tableplugin/CellSelection","tinymce/tableplugin/Dialogs","tinymce/util/Tools","tinymce/dom/TreeWalker","tinymce/Env","tinymce/PluginManager"],function(a,b,c,d,e,f,g,h){function i(e){function f(a){return function(){e.execCommand(a)}}function h(a,b){var c,d,f,h;for(f='<table id="__mce"><tbody>',c=0;b>c;c++){for(f+="<tr>",d=0;a>d;d++)f+="<td>"+(g.ie?" ":"<br>")+"</td>";f+="</tr>"}return f+="</tbody></table>",e.undoManager.transact(function(){e.insertContent(f),h=e.dom.get("__mce"),e.dom.setAttrib(h,"id",null),e.dom.setAttribs(h,e.settings.table_default_attributes||{}),e.dom.setStyles(h,e.settings.table_default_styles||{})}),h}function i(a,b){function c(){a.disabled(!e.dom.getParent(e.selection.getStart(),b)),e.selection.selectorChanged(b,function(b){a.disabled(!b)})}e.initialized?c():e.on("init",c)}function k(){i(this,"table")}function l(){i(this,"td,th")}function m(){var a="";a='<table role="grid" class="mce-grid mce-grid-border" aria-readonly="true">';for(var b=0;10>b;b++){a+="<tr>";for(var c=0;10>c;c++)a+='<td role="gridcell" tabindex="-1"><a id="mcegrid'+(10*b+c)+'" href="#" data-mce-x="'+c+'" data-mce-y="'+b+'"></a></td>';a+="</tr>"}return a+="</table>",a+='<div class="mce-text-center" role="presentation">1 x 1</div>'}function n(a,b,c){var d,f,g,h,i,j=c.getEl().getElementsByTagName("table")[0],k=c.isRtl()||"tl-tr"==c.parent().rel;for(j.nextSibling.innerHTML=a+1+" x "+(b+1),k&&(a=9-a),f=0;10>f;f++)for(d=0;10>d;d++)h=j.rows[f].childNodes[d].firstChild,i=(k?d>=a:a>=d)&&b>=f,e.dom.toggleClass(h,"mce-active",i),i&&(g=h);return g.parentNode}var o,p=this,q=new d(e);e.settings.table_grid===!1?e.addMenuItem("inserttable",{text:"Insert table",icon:"table",context:"table",onclick:q.table}):e.addMenuItem("inserttable",{text:"Insert table",icon:"table",context:"table",ariaHideMenu:!0,onclick:function(a){a.aria&&(this.parent().hideAll(),a.stopImmediatePropagation(),q.table())},onshow:function(){n(0,0,this.menu.items()[0])},onhide:function(){var a=this.menu.items()[0].getEl().getElementsByTagName("a");e.dom.removeClass(a,"mce-active"),e.dom.addClass(a[0],"mce-active")},menu:[{type:"container",html:m(),onPostRender:function(){this.lastX=this.lastY=0},onmousemove:function(a){var b,c,d=a.target;"A"==d.tagName.toUpperCase()&&(b=parseInt(d.getAttribute("data-mce-x"),10),c=parseInt(d.getAttribute("data-mce-y"),10),(this.isRtl()||"tl-tr"==this.parent().rel)&&(b=9-b),(b!==this.lastX||c!==this.lastY)&&(n(b,c,a.control),this.lastX=b,this.lastY=c))},onclick:function(a){var b=this;"A"==a.target.tagName.toUpperCase()&&(a.preventDefault(),a.stopPropagation(),b.parent().cancel(),e.undoManager.transact(function(){h(b.lastX+1,b.lastY+1)}),e.addVisual())}}]}),e.addMenuItem("tableprops",{text:"Table properties",context:"table",onPostRender:k,onclick:q.tableProps}),e.addMenuItem("deletetable",{text:"Delete table",context:"table",onPostRender:k,cmd:"mceTableDelete"}),e.addMenuItem("cell",{separator:"before",text:"Cell",context:"table",menu:[{text:"Cell properties",onclick:f("mceTableCellProps"),onPostRender:l},{text:"Merge cells",onclick:f("mceTableMergeCells"),onPostRender:l},{text:"Split cell",onclick:f("mceTableSplitCells"),onPostRender:l}]}),e.addMenuItem("row",{text:"Row",context:"table",menu:[{text:"Insert row before",onclick:f("mceTableInsertRowBefore"),onPostRender:l},{text:"Insert row after",onclick:f("mceTableInsertRowAfter"),onPostRender:l},{text:"Delete row",onclick:f("mceTableDeleteRow"),onPostRender:l},{text:"Row properties",onclick:f("mceTableRowProps"),onPostRender:l},{text:"-"},{text:"Cut row",onclick:f("mceTableCutRow"),onPostRender:l},{text:"Copy row",onclick:f("mceTableCopyRow"),onPostRender:l},{text:"Paste row before",onclick:f("mceTablePasteRowBefore"),onPostRender:l},{text:"Paste row after",onclick:f("mceTablePasteRowAfter"),onPostRender:l}]}),e.addMenuItem("column",{text:"Column",context:"table",menu:[{text:"Insert column before",onclick:f("mceTableInsertColBefore"),onPostRender:l},{text:"Insert column after",onclick:f("mceTableInsertColAfter"),onPostRender:l},{text:"Delete column",onclick:f("mceTableDeleteCol"),onPostRender:l}]});var r=[];j("inserttable tableprops deletetable | cell row column".split(" "),function(a){r.push("|"==a?{text:"-"}:e.menuItems[a])}),e.addButton("table",{type:"menubutton",title:"Table",menu:r}),g.isIE||e.on("click",function(a){a=a.target,"TABLE"===a.nodeName&&(e.selection.select(a),e.nodeChanged())}),p.quirks=new b(e),e.on("Init",function(){p.cellSelection=new c(e)}),e.on("PreInit",function(){e.serializer.addAttributeFilter("data-mce-cell-padding,data-mce-border,data-mce-border-color",function(a,b){for(var c=a.length;c--;)a[c].attr(b,null)})}),j({mceTableSplitCells:function(a){a.split()},mceTableMergeCells:function(a){var b;b=e.dom.getParent(e.selection.getStart(),"th,td"),e.dom.select("td.mce-item-selected,th.mce-item-selected").length?a.merge():q.merge(a,b)},mceTableInsertRowBefore:function(a){a.insertRow(!0)},mceTableInsertRowAfter:function(a){a.insertRow()},mceTableInsertColBefore:function(a){a.insertCol(!0)},mceTableInsertColAfter:function(a){a.insertCol()},mceTableDeleteCol:function(a){a.deleteCols()},mceTableDeleteRow:function(a){a.deleteRows()},mceTableCutRow:function(a){o=a.cutRows()},mceTableCopyRow:function(a){o=a.copyRows()},mceTablePasteRowBefore:function(a){a.pasteRows(o,!0)},mceTablePasteRowAfter:function(a){a.pasteRows(o)},mceTableDelete:function(a){a.deleteTable()}},function(b,c){e.addCommand(c,function(){var c=new a(e);c&&(b(c),e.execCommand("mceRepaint"),p.cellSelection.clear())})}),j({mceInsertTable:q.table,mceTableProps:function(){q.table(!0)},mceTableRowProps:q.row,mceTableCellProps:q.cell},function(a,b){e.addCommand(b,function(b,c){a(c)})}),e.settings.table_tab_navigation!==!1&&e.on("keydown",function(b){var c,d,f;9==b.keyCode&&(c=e.dom.getParent(e.selection.getStart(),"th,td"),c&&(b.preventDefault(),d=new a(e),f=b.shiftKey?-1:1,e.undoManager.transact(function(){!d.moveRelIdx(c,f)&&f>0&&(d.insertRow(),d.refresh(),d.moveRelIdx(c,f))})))}),p.insertTable=h}var j=e.each;h.add("table",i)})}(this);