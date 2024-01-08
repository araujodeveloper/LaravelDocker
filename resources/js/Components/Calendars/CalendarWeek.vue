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
});

const emit = defineEmits(['dateClick', 'eventClick']);

const id = ref(1);

const calendarOptions = reactive({
  plugins: [dayGridPlugin, interactionPlugin, timeGridPlugin, listPlugin, multiMonthPlugin],
  initialView: 'timeGridWeek',
  locale: ptBrLocale,
  nowIndicator: true,
  editable: true,
  selectable: true,
  weekends:false,
  select: (arg) => {
    const calendar = arg.view.calendar;
    calendar.unselect();
    // calendar.addEvent({
    //   id: `${id.value}`,
    //   title: `New Event ${id.value}`,
    //   start: arg.start,
    //   end: arg.end,
    //   allDay: true,
    //   editable: true,
    //   startEditable: true,
    // });

    handleEventClick(arg);

  },
  eventClick: (arg) => {
     handleEventClick(arg);
  },
  //contentHeight: 650,
  aspectRatio: 2.4,
  businessHours: {
    daysOfWeek: [1, 2, 3, 4, 5], // Monday - Friday
    startTime: '08:00',
    endTime: '18:00', 
  },
  headerToolbar: {
  },
  dateClick: handleDateClick,
  events: [],
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