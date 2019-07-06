package com.epam.worldchat.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.epam.worldchat")
public class WorldChatApplication {

	public static void main(String[] args) {
		SpringApplication.run(WorldChatApplication.class, args);
	}

}
