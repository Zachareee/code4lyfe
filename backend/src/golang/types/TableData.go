package types

type CaregiverCodePairing struct {
	Caregiver string `json:"caregiver"`
	Code      int    `json:"code"`
}

type CaregiverDependentPairing struct {
	Caregiver string `json:"caregiver"`
	Dependent int    `json:"dependent"`
}
