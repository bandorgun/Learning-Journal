

def kalkulator_BMI(berat, tinggi):
    BMI = berat / tinggi**2
    if BMI < 18.5:
        return f"BMI: {BMI}, Underweight"
    elif 18.5 <= BMI <= 24.9:
        return f"BMI: {BMI}, Normal"
    elif 25.0 <= BMI <= 29.9:
        return f"BMI: {BMI}, Overweight"
    elif BMI >= 30:
        return f"BMI: {BMI}, Obese"
