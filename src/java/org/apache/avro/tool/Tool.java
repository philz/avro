package org.apache.avro.tool;

import java.util.List;

/**
 * Command-line "avrotool" utilities should implement this
 * interface for delegation by {@link Main}.
 */
public interface Tool {
  void run(List<String> args) throws Exception;
}
