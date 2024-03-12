## Screen Development Checklist (only includes style, design, and essential elements)

- [x]  Home Screen View
- [x]  Receipts from Album View
- [ ]  Scan Image View
- [ ]  Manual add View
- [ ]  Manual remove View
- [ ]  Date change model View

## Home Screen Actions
Default homescreen for application? (might change if user has data).

- [x]  Arrow buttons toggle month displayed
- [ ]  Show year above month
- [ ]  "Month/Day numbers" function as buttons that navigate to a calculated receipt view for all receipts in that period (month, day, year???(year optional))
  - [ ] Design "calculated receipt view"   
- [ ]  Calculate category and receipt values from database and place onto periods
- [ ]  Date change model View
- [ ]  Button for Add remove manual needs to display 2 navigation options modely (add/remove)

## Receipts from Album View Actions
This screen allows users to choose receipts from their album. These receipts can then be processed and inserted into local tables. Physical images should not be added.

- [x]  Button on homescreen navigates here.
- [x]  Button on this screen to popup the album navigator and choose photos.
- [ ]  grab the unique photo library ID and populate images already selected from this app. (Store and re-reference the unique photo ID. Might want to tie this receipt to the photo ID)
- [ ]  Save button action should allow users to process receipts.
  - [x] Pressing this button should bring users back to the home screen once images have been processed.
- [x]  Horizontal scroll view should allow users to see all photos they've added.
- [ ]  *Optional also allows them to remove the receipt from the scroll view) (*optinally, allow users to view, verify and update subtotals on procesed receipts

## Scan Image Actions
- [ ]  Button on homescreen navigates here.
- [ ]  Navigate directly to the camera. 
- [ ]  Camera should scan (like a qr code) a receipt and display an image of the receipt to the user once identified.
- [ ]  Once receipt is displayed, information on receipt should be processed and displayed to the user. (with options to manualy update)
- [ ]  Button to add data into application and send user back to the home screen
      
## Manual Add Actions
- [ ]  Button on model from homescreen navigates here.
- [ ]  Purchase by category for receipt and dollar amount must be filled
- [ ]  Save button to save changes
- [ ]  Discard button to discard receipt and reset view
- [ ]  Data imported into database with manual boolean

## Manual Remove Actions
- [ ] Need to ask about how best this view should be treated. 

## Date change model Actions
- [ ]  2 options, year and month
- [ ]  toggle the Home Screen view to refelct new date


