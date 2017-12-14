# LocalizationDemo
This app is supposed to demonstrate how **Localizable.stringsdict** could be applied in practice. Currently plurals handling and adaptive strings are implemented.
Content is localized to English, Russian and Polish languages, so you are able to see the difference in plural forms.

## How to use
Run the app with language settings you wish and play with each section inside.

- ### Plurals
   Decrease and increase count to see different plural forms for "day".

- ### Adaptive strings
   See how adaptive string reacts on screen width change. Use "M"-line to calculate M-width. Also you are also able to change font size and label width to see that string value doesn't depend on them. 

- ### Contained adaptive strings VC
   Child viewController with smaller width with adaptive string inside to show that text value depends on screen width only, but not on viewController's view width.

- ### Combined table
   Table with all strings from Localizable.stringsdict.
