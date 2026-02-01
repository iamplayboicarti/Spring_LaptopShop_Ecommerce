package com.example.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // Trả về rỗng nếu không có file
        if (file.isEmpty()) {
            return "";
        }

        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + targetFolder);

            if (!dir.exists())
                dir.mkdirs();

            // Tạo tên file duy nhất
            String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            // Ghi file
            File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

            return fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}