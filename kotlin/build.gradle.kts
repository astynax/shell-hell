plugins {
    kotlin("multiplatform") version "2.0.21"
}

group = "me.astynax.shell_hell"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

kotlin {
    macosX64("native").apply {
        binaries {
            executable {
                entryPoint = "main"
            }
        }
    }

    sourceSets {
        nativeMain {
            dependencies {
                implementation("com.github.ajalt.clikt:clikt:5.0.1")
            }
        }
    }
}
