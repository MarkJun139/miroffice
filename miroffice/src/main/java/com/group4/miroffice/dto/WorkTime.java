package com.group4.miroffice.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class WorkTime {

	private LocalTime startTime;
	private LocalTime endTime;
	private int workTime;
	
}
