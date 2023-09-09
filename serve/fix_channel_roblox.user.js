// ==UserScript==
// @name         Revert channel builds
// @version      1.0.3
// @description  This will revert any channel builds that Roblox has placed on your account and revert it back to the normal version people get.
// @author       BabyHamsta (HamstaGang @ V3RM)
// @match        https://*.roblox.com/*
// @match        https://roblox.com/*
// @icon         https://www.roblox.com/favicon.ico
// @grant        none
// @run-at       document-start
// @inject-into  page
// @license      MIT
// @noframes
// ==/UserScript==

(async () => {
  'use strict';

  while (typeof Roblox == "undefined" || typeof Roblox.ProtocolHandlerClientInterface == "undefined") await new Promise(resolve => setTimeout(resolve));

  let channel = "";
  try {
    let ProtocolHandlerClientInterface = Roblox.ProtocolHandlerClientInterface
    Object.defineProperty(ProtocolHandlerClientInterface, "playerChannel", {
        value: channel,
        writable: false
    });
    Object.defineProperty(ProtocolHandlerClientInterface, "channel", {
        value: channel,
        writable: false
    });
    Object.defineProperty(ProtocolHandlerClientInterface, "studioChannel", {
        value: channel,
        writable: false
    });

    console.warn("Roblox channel reverted successfully!")
  } catch (exception) {
      console.warn("There was an error trying to set the channel:");
      console.error(exception);
  }
})()