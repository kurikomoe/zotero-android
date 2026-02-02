# 忽略 Joda-convert 的缺失警告（这是 Joda-Time 常见的 R8 错误）
-dontwarn org.joda.convert.**

# 忽略 Kotlin Gradle 插件相关的缺失类警告
-dontwarn org.gradle.api.**
-dontwarn org.jetbrains.kotlin.gradle.**

# 保护 EventBus 和手写笔事件逻辑（防止混淆导致功能失效）
-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep class org.zotero.android.pdf.reader.PdfReaderViewModel$StylusShortcutEvent { *; }

# 保护 LibraryIdentifier 及其内部结构，防止 Gson 解析失败
-keep class org.zotero.android.sync.LibraryIdentifier { *; }

# 同时保护与之相关的序列化模型（Zotero 的同步核心模型）
-keep class org.zotero.android.sync.** { *; }
-keep class org.zotero.android.api.pojo.** { *; }

# 保护所有被 Gson 使用的模型（通用规则）
-keepattributes Signature, EnclosingMethod, InnerClasses
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}