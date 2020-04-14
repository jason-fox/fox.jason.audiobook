/*
 *  This file is part of the DITA-OT Audio Plug-in project(.
 *  See the accompanying LICENSE file for applicable licenses.
 */

package fox.jason.audiobook.tasks;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Echo;

// Function to create a Chapter entry

public class CreateChapterEntryTask extends Task {

  /**
   * Creates a new <code>CreateChapterEntryTask</code> instance.
   */
  public CreateChapterEntryTask() {
    super();
  }

  /**
   * Method execute.
   *
   * @throws BuildException if something goes wrong
   */
  @Override
  public void execute() {
    String chapter = getProject().getProperty("chapter.temp.file");
    String[] inputs = getProject().getProperty("ffmpeg.meta.out").split("\n");
    long oldDuration = getProject().getProperty("audiobook.duration") == null
      ? 0
      : Long.parseLong(getProject().getProperty("audiobook.duration"));

    String timeString = null;
    String titleString = null;

    for (String input : inputs) {
      String line = input.trim();
      int start = line.indexOf(':');
      if (line.startsWith("Duration")) {
        timeString = line.substring(start + 2, start + 13);
      } else if (line.startsWith("title")) {
        titleString = line.substring(start + 2);
      }
    }

    SimpleDateFormat ISO8601DATEFORMAT = new SimpleDateFormat(
      "yyyy-MM-dd'T'HH:mm:ssZ"
    );

    try {
      Date datetime = ISO8601DATEFORMAT.parse("1970-01-01T" + timeString + "Z");
      long duration = datetime.getTime();

      String output =
        "\n[CHAPTER]\nTIMEBASE=1/1000\nSTART=" +
        String.valueOf(oldDuration) +
        "\nEND=" +
        String.valueOf(oldDuration + duration) +
        "\ntitle=" +
        titleString +
        "\n#chapter duration " +
        timeString;

      Echo task = (Echo) getProject().createTask("echo");
      task.setFile(new java.io.File(chapter));
      task.setMessage(output);
      task.setAppend(true);
      task.perform();

      getProject()
        .setProperty(
          "audiobook.duration",
          String.valueOf(oldDuration + duration)
        );
    } catch (Exception e) {
      throw new BuildException(e);
    }
  }
}
