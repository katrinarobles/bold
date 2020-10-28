import flatpickr from "flatpickr";

const datePicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
};

export { datePicker };
