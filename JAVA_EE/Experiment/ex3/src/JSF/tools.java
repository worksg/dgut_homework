package JSF;

import java.io.*;

public class tools {
	public boolean isExist(String path) throws IOException {
		File file = new File(path);
		if (!file.exists() || file.length() == 0) {
			file.createNewFile();
			return false;
		} else {
			return true;
		}

	}
	public void write(String file_path, String json)
			throws FileNotFoundException, UnsupportedEncodingException, IOException {
		FileOutputStream writerStream = new FileOutputStream(file_path, true);
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(writerStream, "UTF-8"));
		writer.write(json);
		writer.close();
	}

}