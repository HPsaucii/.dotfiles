{ pkgs, config, firefox-addons, ...}:

{
	programs.firefox = {
		enable = true;
		profiles.holly = {
			name = "holly";
			settings = {
				"browser.startup.homepage" = "http://localhost:3000";
				"webgl.disabled" = true;
				"privacy.resistFingerprinting" = true;
				"privacy.resistFingerprinting.letterboxing" = true;
				"network.http.referer.XOriginPolicy" = 2;
				"browser.sessionstore.resume_from_crash" = false;
				"middlemouse.paste" = false;
				"general.autoScroll" = true;
				"media.autoplay.blocking_policy" = 2;
				"security.OCSP.require" = true;
				"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
				"browser.toolbars.bookmarks.visibility" = "never";
				"privacy.clearOnShutdown.history" = true;
				"browser.tabs.tabmanager.enabled" = false;
				"app.normandy.first_run" = false;
				"doh-rollout.doneFirstRun" = true;
				"dom.disable_open_during_load" = false;
			};
			search = {
				force = true;
				default = "Gruble";
				engines = {
					"Gruble" = {
						urls = [{template = "https://gruble.de/search?q={searchTerms}"; }];
						iconupdateURL = "https://gruble.de/static/themes/simple/img/favicon.svg?19836421f141327db85d5318ff62009013a03676";
					};
				};
			};
			extensions = with firefox-addons.packages."x86_64-linux"; [
				firefox-color
				stylus
				new-tab-override
				proton-pass
				ublock-origin
			];
			bookmarks = [
			  {
			    name = "Inital Setup";
			    toolbar = true;
			    bookmarks = [
			      {
			        name = "Firefox Color";
			        url = "https://color.firefox.com/?theme=XQAAAAJEBAAAAAAAAABBqYhm849SCicxcUcPX38oKRicm6da8pFtMcajvXaAE3RJ0F_F447xQs-L1kFlGgDKq4IIvWciiy4upusW7OvXIRinrLrwLvjXB37kvhN5ElayHo02fx3o8RrDShIhRpNiQMOdww5V2sCMLAfehhpkvCNGPFQ9qpGpx7BgGSYPGUMFXC1Ua9FaxHdWOc93hEJrTCm7pTY2gENlkIGOUk-0q5koU7B1u0Ej-oMph40xEOeck_YUJD52Bwer09STdlto8FTe2opihD2FyRdpJyZydtlY3dK_RO373JUB4GPAs2saJone2-92ozhdZDXTzFe1BzECDYiTLKw8wgkHlYGBfEaHwiRhB6Xx67wrqMSr8VhLm8d-NCA1DySJVtxxWJN-qabWQpDds2gw6dhs97Ngt5Z_6ZhJ5vv31xfjj2v6iK816VOdJaIaQu4xsqHAytxXRLJQ8LtmF0BsXZI5kUVsRJUHALGJAvl388n-yyQfaq8ZWzVK-rrBoAJJqwlvJaa-7K1eFh6NaMojpf5pl-eqKMtg1KMmYlS4DjK6Z__leZhs";
			      }
			      {
			      	name = "Stylus";
			      	url = "https://aui.ctp.uncenter.dev/";
			      }
			    ];
			  }
			];
			userChrome = ''
				/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/navbar_tabs_oneliner.css made available under Mozilla Public License v. 2.0
				See the above repository for updates as well as full license text. */
				
				/* Make tabs and navbar appear side-by-side tabs on right */
				
				/* Use page_action_buttons_on_hover.css to hide page-action-buttons to save more space for the address */
				
				/*
				urlbar_popup_full_width.css is VERY MUCH recommended for Firefox 71+ because of new urlbar popup
				*/
				:root[tabsintitlebar][sizemode="normal"]{
				  --uc-window-drag-space-width: 24px;
				}
				:root[uidensity="compact"]{
				  --tab-block-margin: 2px !important;
				}
				
				/* Modify these to change relative widths or default height */
				#navigator-toolbox{
				  --uc-navigationbar-width: 40vw;
				  --uc-toolbar-height: 40px;
				  --uc-urlbar-min-width: 50vw; /* minimum width for opened urlbar */
				}
				
				#scrollbutton-up,
				#scrollbutton-down{ border-block-width: 2px !important; }
				
				/* Override for other densities */
				:root[uidensity="compact"] #navigator-toolbox{ --uc-toolbar-height: 34px; }
				:root[uidensity="touch"] #navigator-toolbox{ --uc-toolbar-height: 44px; }
				
				/* prevent urlbar overflow on narrow windows */
				/* Dependent on how many items are in navigation toolbar ADJUST AS NEEDED */
				@media screen and (max-width: 1500px){
				    #urlbar-container{
				      min-width: 300px !important;
				      flex-shrink: 1 !important;
				    }
				}
				
				#TabsToolbar{
				  margin-left: var(--uc-navigationbar-width);
				  --tabs-navbar-shadow-size: 0px;
				}
				#tabbrowser-tabs{
				  --tab-min-height: calc(var(--uc-toolbar-height) - 2 * var(--tab-block-margin,0px)) !important;
				}
				
				/* This isn't useful when tabs start in the middle of the window */
				
				.titlebar-spacer[type="pre-tabs"]{ display: none }
				
				#navigator-toolbox > #nav-bar{
				  margin-right:calc(100vw - var(--uc-navigationbar-width));
				  margin-top: calc(0px - var(--uc-toolbar-height));
				}
				
				/* Window drag space  */
				:root[tabsintitlebar="true"] #nav-bar{ padding-left: var(--uc-window-drag-space-width) !important }
				
				/* Rules for window controls on left layout */
				
				@media (-moz-gtk-csd-reversed-placement),
				       (-moz-platform: macos){
				  .titlebar-buttonbox-container{
				    position: fixed;
				    display: flex;
				    left: 0px;
				    z-index: 3;
				    height: var(--uc-toolbar-height);
				    align-items: center
				  }
				  :root[tabsintitlebar="true"] #nav-bar{ padding-inline: calc(var(--uc-window-drag-space-width,0px) + 84px) 0px !important; }
				}
				@media (-moz-platform: macos){
				  :root[tabsintitlebar="true"] #nav-bar{ padding-inline: calc(var(--uc-window-drag-space-width,0px) + 72px) 0px !important; }
				}
				
				/* 1px margin on touch density causes tabs to be too high */
				.tab-close-button{ margin-top: 0 !important }
				
				/* Make opened urlbar overlay the toolbar */
				#urlbar[open]:focus-within{ min-width: var(--uc-urlbar-min-width,none) !important; }
				
				/* Hide dropdown placeholder */
				#urlbar-container:not(:hover) .urlbar-history-dropmarker{ margin-inline-start: -28px; }
				
				/* Fix customization view */
				#customization-panelWrapper > .panel-arrowbox > .panel-arrow{ margin-inline-end: initial !important; }

				.titlebar-buttonbox-container{ display:none } 

				#unified-extensions-button[attention] > .toolbarbutton-icon,
				.unified-extensions-item[attention] > .unified-extensions-item-action-button.toolbarbutton-1 > .toolbarbutton-badge-stack {
				  background-image: none !important;
				}
			'';
		};
	};
}
