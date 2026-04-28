# Power BI Visual Customization Guide

Use this guide to change the current green dashboard into the updated dark cyan, blue, amber, and purple style.

## 1. Import the New Theme
Open the `.pbix` file in Power BI Desktop.

Go to:

`View > Themes > Browse for themes`

Choose:

`PowerBI/Consumer_Complaints_Black_Blue_Theme.json`

Save the report after import.

## 2. Replace Remaining Green Chart Colors
Some visuals may keep old manual colors. For each green chart:

1. Click the chart.
2. Open **Format visual**.
3. Go to **Data colors**.
4. Replace green with one of these:

* Main bars or lines: `#25D0D9`
* Secondary bars: `#2F80ED`
* Highlight or peak month: `#F59E0B`
* Comparison slices: `#7C3AED`
* Late or "No" responses: `#FF4D4D`

## 3. Suggested Visual Representation Changes
Use these small changes to make the dashboard look more polished:

* Change the **Month Wise Complaints** line from green to cyan and increase stroke width slightly.
* Change the July peak marker to amber if you want to highlight the seasonal spike.
* Use cyan or blue for normal complaint counts.
* Use red only for late or negative response categories.
* Keep slicer backgrounds light cyan so they stand apart from the black canvas.
* Keep card KPI numbers cyan and card labels soft white.

## 4. Page-Level Color Settings
For every report page:

* Canvas background: `#0B0F0E`
* Visual background: `#121C18`
* Border: `#25D0D9`
* Title text: `#B8D8C0`
* Axis and label text: `#B8D8C0`
* Gridlines: `#33433A`

## 5. Final Export
After updating colors:

1. Press `Ctrl + S`.
2. Export again from `File > Export > PDF`.
3. Replace the old PDF export with the updated one.
