/*
 *  This file is part of the DITA-OT Audio Plug-in project.
 *  See the accompanying LICENSE file for applicable licenses.
 */

package fox.jason.audiobook.tasks;

import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.MacroInstance;
import org.apache.tools.ant.util.FileUtils;

//
//    Iterator function to run a given macro against a set of files
//

public class IterateTracklistTask extends Task {
  /**
   * Field macro.
   */
  private String macro;
  /**
   * Field dir.
   */
  private String file;

  /**
   * Field dir.
   */
  private String dir;

  /**
   * Creates a new <code>IterateTracklistTask</code> instance.
   */
  public IterateTracklistTask() {
    super();
    this.dir = null;
    this.file = null;
    this.macro = null;
  }

  /**
   * Method setDir.
   *
   * @param dir String
   */
  public void setDir(String dir) {
    this.dir = dir;
  }

  /**
   * Method setFile.
   *
   * @param file String
   */
  public void setFile(String file) {
    this.file = file;
  }

  /**
   * Method setMacro.
   *
   * @param macro String
   */
  public void setMacro(String macro) {
    this.macro = macro;
  }

  /**
   * Method execute.
   *
   * @throws BuildException if something goes wrong
   */
  @Override
  public void execute() {
    //    @param file - A file holding the location of the mp3 files
    //    @param dir  - The location of the files to process
    //    @param macro - A macro to run.
    if (this.dir == null) {
      throw new BuildException(
        "You must supply the location of the files to process"
      );
    }
    if (this.file == null) {
      throw new BuildException(
        "You must supply a file holding the location of the mp3 files"
      );
    }
    if (this.macro == null) {
      throw new BuildException("You must supply a macro");
    }

    try {
      String tracklist = FileUtils.readFully(new java.io.FileReader(file));

      boolean failed = false;
      int index = 1;

      for (String track : tracklist.split("\n")) {
        if (!"".equals(track)) {
          MacroInstance task = (MacroInstance) getProject().createTask(macro);
          track = track.substring(5);
          try {
            task.setDynamicAttribute(
              "src",
              track.substring(0, track.length() - 3) + "ssml"
            );
            task.setDynamicAttribute("dest", track);
            task.setDynamicAttribute("dir", dir);
            task.setDynamicAttribute("track", String.valueOf(index));
            task.execute();
          } catch (Exception err) {
            failed = true;
          }
          index++;
        }
      }
      if (failed) {
        getProject().setProperty("ssml.failed", "true");
      }
    } catch (IOException e) {
      throw new BuildException(e);
    }
  }
}
