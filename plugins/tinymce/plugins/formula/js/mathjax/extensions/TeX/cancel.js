MathJax.Extension["TeX/cancel"]={version:"2.7.0",ALLOWED:{color:1,mathcolor:1,background:1,mathbackground:1,padding:1,thickness:1}},MathJax.Hub.Register.StartupHook("TeX Jax Ready",function(){var t=MathJax.InputJax.TeX,e=MathJax.ElementJax.mml,a=MathJax.Extension["TeX/cancel"];a.setAttributes=function(t,e){if(""!==e){e=e.replace(/ /g,"").split(/,/);for(var n=0,s=e.length;n<s;n++){var c=e[n].split(/[:=]/);a.ALLOWED[c[0]]&&("true"===c[1]&&(c[1]=!0),"false"===c[1]&&(c[1]=!1),t[c[0]]=c[1])}}return t},t.Definitions.Add({macros:{cancel:["Cancel",e.NOTATION.UPDIAGONALSTRIKE],bcancel:["Cancel",e.NOTATION.DOWNDIAGONALSTRIKE],xcancel:["Cancel",e.NOTATION.UPDIAGONALSTRIKE+" "+e.NOTATION.DOWNDIAGONALSTRIKE],cancelto:"CancelTo"}},null,!0),t.Parse.Augment({Cancel:function(t,n){var s=this.GetBrackets(t,""),c=this.ParseArg(t),i=a.setAttributes({notation:n},s);this.Push(e.menclose(c).With(i))},CancelTo:function(t,n){var s=this.ParseArg(t),c=this.GetBrackets(t,""),i=this.ParseArg(t),o=a.setAttributes({notation:e.NOTATION.UPDIAGONALSTRIKE+" "+e.NOTATION.UPDIAGONALARROW},c);s=e.mpadded(s).With({depth:"-.1em",height:"+.1em",voffset:".1em"}),this.Push(e.msup(e.menclose(i).With(o),s))}}),MathJax.Hub.Startup.signal.Post("TeX cancel Ready")}),MathJax.Ajax.loadComplete("[MathJax]/extensions/TeX/cancel.js");