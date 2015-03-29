package com.krylysov.nsisplugin.psi;

import com.intellij.psi.tree.IElementType;
import com.krylysov.nsisplugin.NsisLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class NsisElementType extends IElementType {
    public NsisElementType(@NotNull @NonNls String debugName) {
        super(debugName, NsisLanguage.INSTANCE);
    }
}