package com.bit.domain;

import lombok.Data;

@Data
public class MyMajorVO {
	private String StudentID;
	private int MajorCode;
	private String MajorName;
	private String MajorTime;
	private String MajorLocation;
	private int TargetGrade;
	private int MajorLimit;
	private int GradePoint;
	private String Professor;
	private String MajorDivision;
}
