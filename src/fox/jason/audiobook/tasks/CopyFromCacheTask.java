/*
 *  This file is part of the DITA-OT Audio Plug-in project.
 *  See the accompanying LICENSE file for applicable licenses.
 */

package fox.jason.audiobook.tasks;

import java.io.IOException;
import java.util.Arrays;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Copy;
import org.apache.tools.ant.util.FileUtils;

//
//  Copy existing file to avoid running a real text-speech service
//

public class CopyFromCacheTask extends Task {
  /**
   * Field md5.
   */
  private String md5;
  /**
   * Field out.
   */
  private String out;

  /**
   * Creates a new <code>CopyFromCacheTask</code> instance.
   */
  public CopyFromCacheTask() {
    super();
    this.md5 = null;
    this.out = null;
  }

  /**
   * Method setMd5.
   *
   * @param md5 String
   */
  public void setMd5(String md5) {
    this.md5 = md5;
  }

  /**
   * Method setOut.
   *
   * @param out String
   */
  public void setOut(String out) {
    this.out = out;
  }

  /**
   * Method execute.
   *
   * @throws BuildException if something goes wrong
   */
  @Override
  public void execute() {
    //  @param md5  - The location of the files to process
    //  @param out  - The location of the files to process
    if (this.md5 == null) {
      throw new BuildException("You must supply an md5 hash");
    }
    if (this.out == null) {
      throw new BuildException("You must supply a destination directory");
    }

    try {
      String cachefile = getProject().getProperty("mp3.cachefile");
      String fileslist = FileUtils.readFully(new java.io.FileReader(cachefile));

      for (String line : fileslist.split("\n")) {
        line = line.trim();
        if (line.endsWith(md5)) {
          String[] parts = line.split(".");
          String file =
            cachefile.substring(0, cachefile.lastIndexOf('/')) +
            "/" +
            String.join(".", Arrays.copyOf(parts, parts.length - 1)) +
            ".mp3";

          Copy task = (Copy) getProject().createTask("copy");
          task.setTaskName("mp3-cache-copy");
          task.setFile(new java.io.File(file));
          task.setTofile(new java.io.File(out));
          task.setOverwrite(true);
          task.perform();
          break;
        }
      }
    } catch (IOException e) {
      throw new BuildException(e);
    }
  }
}
