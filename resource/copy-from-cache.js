/*
 *  This file is part of the DITA-OT Audiobook Plug-in project.
 *  See the accompanying LICENSE file for applicable licenses.
 */

//	Copy existing file to avoid running a real text-speech service
//
//	@param src  - The location of the files to process
//	@param out  - The location of the files to process

var cachefile = project.getProperty("mp3.cachefile");
var md5 = attributes.get("md5");
var out = attributes.get("out");
var fileslist = org.apache.tools.ant.util.FileUtils.readFully(
  new java.io.FileReader(cachefile)
);
var lines = fileslist.split("\n");
var line = null;

for (i = 0; i < lines.length; ++i) {
  line = lines[i].trim();
  if (line.endsWith(md5)) {
    break;
  }
}

var file =
  cachefile.substr(0, cachefile.lastIndexOf("/")) +
  "/" +
  line
    .split(".")
    .slice(0, -1)
    .join(".") +
  ".mp3";

var task = project.createTask("copy");
task.setFile(new java.io.File(file));
task.setTofile(new java.io.File(out));
task.setOverwrite(true);
task.setTaskName("mp3-cache-copy");
task.perform();
