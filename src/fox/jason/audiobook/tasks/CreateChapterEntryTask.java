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
  private static final String DURATION = "audiobook.duration";
  private static final String CHAPTER_FILE = "chapter.temp.file";
  private static final String METADATA = "ffmpeg.meta.out";

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
    String chapter = getProject().getProperty(CHAPTER_FILE);
    String[] inputs = getProject().getProperty(METADATA).split("\n");
    long oldDuration = getProject().getProperty(DURATION) == null
      ? 0
      : Long.parseLong(getProject().getProperty(DURATION));

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

    SimpleDateFormat iso8601DateFormat = new SimpleDateFormat(
      "yyyy-MM-dd'T'HH:mm:ssZ"
    );

    try {
      Date datetime = iso8601DateFormat.parse("1970-01-01T" + timeString + "Z");
      long duration = datetime.getTime();

      String output =
        "\n[CHAPTER]\nTIMEBASE=1/1000\nSTART=" +
        oldDuration +
        "\nEND=" +
        (oldDuration + duration) +
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
        .setProperty(DURATION, String.valueOf(oldDuration + duration));
    } catch (Exception e) {
      throw new BuildException(e);
    }
  }
}
