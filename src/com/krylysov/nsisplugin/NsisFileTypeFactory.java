package com.krylysov.nsisplugin;

import com.intellij.openapi.fileTypes.FileTypeConsumer;
import com.intellij.openapi.fileTypes.FileTypeFactory;
import org.jetbrains.annotations.NotNull;

public class NsisFileTypeFactory extends FileTypeFactory {
    @Override
    public void createFileTypes(@NotNull FileTypeConsumer fileTypeConsumer) {
        fileTypeConsumer.consume(NsisFileType.INSTANCE, "nsi");
        fileTypeConsumer.consume(NsisFileType.INSTANCE, "nsh");
    }
}