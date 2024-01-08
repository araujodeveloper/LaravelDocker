<script setup>
import { ref, reactive } from 'vue'
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import multiMonthPlugin from '@fullcalendar/multimonth';
import ptBrLocale from '@fullcalendar/core/locales/pt-br';


const props = defineProps({
  initialView: String,
  events: Array,
});

const emit = defineEmits(['dateClick', 'eventClick']);

const calendarOptions = reactive({
  plugins: [dayGridPlugin, interactionPlugin, timeGridPlugin, listPlugin, multiMonthPlugin],
  initialView: 'dayGridMonth',
  locale: ptBrLocale,
  nowIndicator: true,
  editable: true,
  selectable: false,
  weekends:false,
  eventClick: (arg) => {
     handleEventClick(arg);
  },
  aspectRatio: 2.4,
  businessHours: {
    // days of week. an array of zero-based day of week integers (0=Sunday)
    daysOfWeek: [1, 2, 3, 4, 5], // Monday - Friday

    startTime: '08:00',
    endTime: '18:00', 
  },
  dateClick: handleDateClick,
  events: props.events,
  eventDisplay: 'block',
  eventTimeFormat: { // like '14:30:00'
    hour: '2-digit',
    minute: '2-digit',
    //second: '2-digit',
    meridiem: false
  },
  headerToolbar: {
    left: 'prev,today,next',
    center: 'title',
    right: 'dayGridMonth, timeGridWeek, timeGridDay'
  },
  
})


function handleDateClick(clickInfo) {
  emit('dateClick', clickInfo);
}

function handleEventClick(eventInfo){
  emit('eventClick', eventInfo);
}

</script>
<template>
  <FullCalendar :options="calendarOptions" />
</template>