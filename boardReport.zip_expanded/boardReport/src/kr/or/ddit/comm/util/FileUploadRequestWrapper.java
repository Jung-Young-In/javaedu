package kr.or.ddit.comm.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadRequestWrapper extends HttpServletRequestWrapper {
    public static final String UPLOAD_DIRECTORY = "d:/D_Other/upload_files";		
    private boolean multipart = false;	

    private Map<String, String[]> parameterMap;	
    private Map<String, Object> fileItemMap;	 

    public FileUploadRequestWrapper(HttpServletRequest request)
    throws FileUploadException{
        this(request, -1, -1, -1, null);
    }

    public FileUploadRequestWrapper(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {
        super(request);

        parsing(request, memoryThreshold, fileSizeMax, maxRequestSize, repositoryPath);
    }

    private void parsing(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {

        if (ServletFileUpload.isMultipartContent(request)) {
            multipart = true; 

            parameterMap = new HashMap<>();
            fileItemMap = new HashMap<>();

            DiskFileItemFactory factory = new DiskFileItemFactory();
            if (memoryThreshold != -1) {
            	factory.setSizeThreshold(memoryThreshold);
            }
            if (repositoryPath != null) {
            	factory.setRepository(new File(repositoryPath));
            }else {
            	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            }

            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            servletFileUpload.setFileSizeMax(fileSizeMax);
            servletFileUpload.setSizeMax(maxRequestSize);

            List<FileItem> list = servletFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName(); 

                if (fileItem.isFormField()) { 
                    String value = "";
					try {
						
						value = fileItem.getString("UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) { 
                        values = new String[] { value };
                    } else { 
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, values.length);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);
                } else { 
                	if(fileItem.getSize() > 0) { 
                		fileItemMap.put(name, fileItem);
                	}
                }
            }
            addTo(); 
        }
    }

    public boolean isMultipartContent() {
        return multipart;
    }

    public String getParameter(String name) {
        if (multipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }

    public String[] getParameterValues(String name) {
        if (multipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }

    public Enumeration<String> getParameterNames() {
        if (multipart) {
            return new Enumeration<String>() {
                Iterator<String> iter = parameterMap.keySet().iterator();

                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public String nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }

    public Map<String, String[]> getParameterMap() {
        if (multipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }

    public Map<String, Object> getFileItemMap() {
    	 if (multipart)
             return fileItemMap;
         else
             return null;
    }

    public FileItem getFileItem(String name) {
        if (multipart)
            return (FileItem) fileItemMap.get(name);
        else
            return null;
    }

    public void delete() {
        if (multipart) {
            Iterator<Object> fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem fileItem = (FileItem)fileItemIter.next();
                fileItem.delete();
            }
        }
    }

    public void addTo() {
      super.setAttribute(FileUploadRequestWrapper.class.getName(), this);
    }

    public static boolean hasWrapper(HttpServletRequest request) {
    	if (FileUploadRequestWrapper.getFrom(request) == null) {
    		return false;
    	} else {
    		return true;
    	}
    }

    public static FileUploadRequestWrapper
                  getFrom(HttpServletRequest request) {
        return (FileUploadRequestWrapper)
            request.getAttribute(FileUploadRequestWrapper.class.getName());
    }
}
