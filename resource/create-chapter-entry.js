/*
 *  This file is part of the DITA-OT Audiobook Plug-in project.
 *  See the accompanying LICENSE file for applicable licenses.
 */

// Function to create a Chapter entry

var chapter = project.getProperty("chapter.temp.file");
var input = project.getProperty("ffmpeg.meta.out").split("\n");
var oldDuration = project.getProperty("audiobook.duration");
var timeString;
var titleString;

for (var i = 0; i < input.length; ++i) {
  var line = input[i].trim();
  var start = line.indexOf(":");
  if (line.startsWith("Duration")) {
    timeString = line.substring(start + 2, start + 13);
  } else if (line.startsWith("title")) {
    titleString = line.substring(start + 2);
  }
}

var datetime = new Date("1970-01-01T" + timeString + "Z");
var duration = datetime.getTime();

var output =
  "\n[CHAPTER]\nTIMEBASE=1/1000\nSTART=" +
  Number(oldDuration) +
  "\nEND=" +
  (Number(oldDuration) + duration) +
  "\ntitle=" +
  titleString +
  "\n#chapter duration " +
  timeString;

var task = project.createTask("echo");
task.setFile(new java.io.File(chapter));
task.setMessage(output);
task.setAppend(true);
task.perform();

project.setProperty("audiobook.duration", Number(oldDuration) + duration);
