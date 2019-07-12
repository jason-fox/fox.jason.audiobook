/*
 *  This file is part of the DITA-OT Audiobook Plug-in project.
 *  See the accompanying LICENSE file for applicable licenses.
 */

//
//    Iterator function to run a given macro against a set of files
//
//    @param file - A file holding the location of the mp3 files
//    @param dir  - The location of the files to process
//    @param macro - A macro to run.

var dir = attributes.get("dir");
var file = attributes.get("file");
var macro = attributes.get("macro");

var tracklist = org.apache.tools.ant.util.FileUtils.readFully(
  new java.io.FileReader(file)
);
var tracks = tracklist.split("\n");
var failed = false;

for (i = 0; i < tracks.length; ++i) {
  task = project.createTask(macro);
  if (tracks[i] !== "") {
    track = tracks[i].substring(5);
    try {
      task.setDynamicAttribute("src", track.slice(0, -3) + "ssml");
      task.setDynamicAttribute("dest", track);
      task.setDynamicAttribute("dir", dir);
      task.setDynamicAttribute("track", i + 1);
      task.execute();
    } catch (err) {
      failed = true;
    }
  }
}

if (failed) {
  project.setProperty("ssml.failed", true);
}
