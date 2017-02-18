# DLAlert
An implementation of UIAlertContoller which can display multiple alerts one by one

## Usage
> Add the DLAlert directory to your project, and import `DLAlertController` to the files where you want to call out an alert view.

DLAlert has a similar usage of UIAlertController.

All you need to do is to create the actions you need, and present the alerts through a class method of `DLAlertController`.

```
DLAlertAction *ok = [DLAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(DLAlertAction *action) {
    // do something if user tapped OK
}];
DLAlertAction *cancel = [DLAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(DLAlertAction *action) {
    // do something if user tapped Cancel
}];
[DLAlertController presentWithTitle:@"Alert" message:message actions:@[cancel, ok]];
```

## What's more
`DLAlertManager` will organize all the alerts you chosen to present and show them on screen one after another.

No need to worry about the timing and whether or not there is an alert being presented right now, just present it through `+[DLAlertController presentWithTitle:message:actions:]`. 
All your AlertViews will wait in line and present themselves in order.

## Bonus
There is a category -- `DLAlertController+Authorization` -- which may come in handy. Feel free to add more functions to it.
