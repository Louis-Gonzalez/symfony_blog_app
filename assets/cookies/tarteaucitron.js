var tarteaucitronCustomText = {
    "mandatoryText": 
    "Ce site utilise des cookies nécessaires à son bon fonctionnement notamment pour "
    + "le système de paiement Monetico du Crédit Mutuel. Ils ne peuvent être désactivés."
};
tarteaucitron.init({
    "privacyUrl": "", /* Privacy policy url */
    "hashtag": "#tarteaucitron", /* Open the panel with this hashtag */
    "cookieName": "tarteaucitron", /* Cookie name */
    "orientation": "top", /* Banner position (top - bottom - middle - popup) */
    "groupServices": false, /* Group services by category */
    "showAlertSmall": false, /* Show the small banner on bottom right */
    "cookieslist": true, /* Show the cookie list */
    "showIcon": false, /* Show cookie icon to manage cookies */
    "iconPosition": "BottomRight", /* Position of the icon between BottomRight, BottomLeft, TopRight and TopLeft */
    "adblocker": false, /* Show a Warning if an adblocker is detected */
    "DenyAllCta": false, /* Show the deny all button */
    "AcceptAllCta": true, /* Show the accept all button when highPrivacy on */
    "highPrivacy": true, /* HIGHLY RECOMMANDED Disable auto consent */
    "handleBrowserDNTRequest": false, /* If Do Not Track == 1, disallow all */
    "removeCredit": true, /* Remove credit link */
    "moreInfoLink": false, /* Show more info link */
    "useExternalCss": false, /* If false, the tarteaucitron.css file will be loaded */
    "readmoreLink": "", /* Change the default readmore link pointing to tarteaucitron.io */
    "mandatory": true /* Show a message about mandatory cookies */
});
tarteaucitron.user.gtagUa = 'G-XXXX';
tarteaucitron.user.gtagMore = function () { };
(tarteaucitron.job = tarteaucitron.job || []).push('gtag');

