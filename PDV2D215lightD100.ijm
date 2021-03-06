//Paper Disc Groundwater Velocimeter Analysis 600dpi (C)Koichi Yamamoto, March 2020
DOT=100
RMAX=215
DPI=600
title2=getTitle();
run("Set Scale...", "distance=DPI known=2.54 unit=cm");
run("Duplicate...", "title=analysis");
run("Duplicate...", "title=analysis2");
selectWindow("analysis");
run("RGB Stack");
run("Stack to Images");
selectWindow("Red");
run("Duplicate...", "Red-1");
run("Duplicate...", "Red-2");
selectWindow("Red-1");
run("Threshold...");
setThreshold(0, RMAX);
setOption("BlackBackground", false);
run("Convert to Mask");
selectWindow("Red");
run("Subtract...", "value=78");
selectWindow("Blue");
run("Divide...", "value=1.516");
imageCalculator("Subtract create", "Blue","Red");
imageCalculator("AND create", "Result of Blue","Red-1");
setThreshold(1, 255);
run("Convert to Mask");
run("Set Measurements...", "area center invert redirect=None decimal=3");
run("Analyze Particles...", "size=0.06-Infinity circularity=0.05-1.00 show=Outlines display exclude");
selectWindow("Red-2");
setAutoThreshold("Default dark");
run("Threshold...");
setThreshold(0, DOT);
run("Analyze Particles...", "size=0.05-infinity circularity=0.2-1.00 show=Outlines display exclude");
imageCalculator("Min create", "analysis2","Drawing of Result of Result of Blue");
imageCalculator("Min create", "Result of analysis2","Drawing of Red-2");
selectWindow("Result of Result of analysis2");
run("Scale Bar...", "width=1 height=8 font=28 color=Black background=None location=[Lower Right] bold");
title3="Extraction result_of "+title2+" in D="+DOT+", Rmax="+RMAX
rename(title3);
selectWindow("Drawing of Red-2");
close();
selectWindow("Red-2");
close();
selectWindow("Drawing of Result of Result of Blue");
close();
selectWindow("Result of Result of Blue");
close();
selectWindow("Result of Blue");
close();
selectWindow("Red");
close();
selectWindow("Red-1");
close();
selectWindow("Blue");
close();
selectWindow("Green");
close();
selectWindow("analysis2");
close();
selectWindow("Result of analysis2");
close();
