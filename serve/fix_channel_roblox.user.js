// ==UserScript==
// @name         Revert channel builds
// @version      1.0.1
// @description  This will revert any channel builds that Roblox has placed on your account and revert it back to the 32-bit version of Roblox (temporarily...).
// @author       BabyHamsta (HamstaGang @ V3RM), fxe (fxeP1)
// @match        https://*.roblox.com/*
// @match        https://roblox.com/*
// @icon         https://www.roblox.com/favicon.ico
// @grant        none
// @run-at       document-start
// @license      MIT
// @noframes
// ==/UserScript==

// fxe#0385 (597464577822687250) @ Script-Ware
(async () => {
  'use strict';

  while (typeof Roblox == "undefined" || typeof Roblox.ProtocolHandlerClientInterface == "undefined") await new Promise(resolve => setTimeout(resolve))

  try {
    let ProtocolHandlerClientInterface = Roblox.ProtocolHandlerClientInterface
    Object.defineProperty(ProtocolHandlerClientInterface, "playerChannel", {
        value: "zlive",
        writable: false
    });
    Object.defineProperty(ProtocolHandlerClientInterface, "channel", {
        value: "zlive",
        writable: false
    });
    Object.defineProperty(ProtocolHandlerClientInterface, "studioChannel", {
        value: "",
        writable: false
    });

    console.warn("Roblox channel reverted successfully!")
  } catch (exception) {
      console.warn("There was an error trying to set the channel:");
      console.error(exception);
  }
})()