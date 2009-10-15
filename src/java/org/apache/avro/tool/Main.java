package org.apache.avro.tool;

import java.util.Arrays;

import org.apache.avro.specific.SpecificCompiler.SpecificCompilerTool;

import com.google.common.collect.ImmutableMap;

/**
 * Wrapper class for "avrotool".  This class is responsible for delegating
 * to the actual tool binaries.
 */
public class Main {
  /**
   * Available tools.
   */
  private final ImmutableMap<String, Tool> tools = new ImmutableMap.Builder<String, Tool>()
    .put("compile", new SpecificCompilerTool())
    .build();
  
  public static void main(String[] args) throws Exception {
    new Main().run(args);
  }

  /**
   * Delegates to tool specified on the command-line. 
   */
  private void run(String[] args) throws Exception {
    if (args.length != 0) {
      Tool tool = tools.get(args[0]);
      if (tool != null) {
        tool.run(Arrays.asList(args).subList(1, args.length));
        return;
      }
    }
    System.err.println("Expected one of the following arguments:");
    for (String k : tools.keySet()) {
      System.err.println("\t" + k);
    }
  }

}
