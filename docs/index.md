<h1>Audiobook for DITA-OT</h1>

This DITA-OT plug-in transforms DITA to speech in the form of an audiobook. It uses freely available Text-to-Speech cloud services to transform SSML files into MP3 audio files or a single `m4a` audiobook.

<h2>DITA Topic</h2>

```xml
<task id="replacecover" xml:lang="en-us">
  <title>Replace the cover of your system.</title>
  <shortdesc>The cover needs to be put back on to reduce problems from dust.</shortdesc>
  <taskbody>
    <steps>
      <step>
        <cmd>Retrieve the computer's cover from its safe place. Put it back on.</cmd>
      </step>
      <step>
        <cmd>Retrieve the screws from the safe place. Put them back in.</cmd>
      </step>
      <step>
        <cmd>Put away your screwdriver before you lose it.</cmd>
      </step>
    </steps>
  </taskbody>
</task>
```

<h2>MP3 Output File</h2>

<audio controls>
  <source src="https://jason-fox.github.io/fox.jason.audiobook/replacecover.mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>