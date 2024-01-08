<script setup>
import { ref, reactive, watch } from 'vue'
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import multiMonthPlugin from '@fullcalendar/multimonth';
import ptBrLocale from '@fullcalendar/core/locales/pt-br';
import { log10 } from 'chart.js/helpers';


const props = defineProps({
  initialView: String,
  events: Array,
});

const emit = defineEmits(['dateClick', 'eventClick']);

const calendarOptions = reactive({
  plugins: [dayGridPlugin, interactionPlugin, timeGridPlugin, listPlugin, multiMonthPlugin],
  initialView: 'timeGridDay',
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
    //   allDay: false,
    //   editable: true,
    //   startEditable: true,
    // });



//  ALGORÍTMO PARA MANIPULAÇÃO DOS VALORES DE HORA DE INICIO E HORA DE FIM
    
    // let dateAndTime = arg.startStr.split("T");
    // let date = dateAndTime[0];
    // let hour = dateAndTime[1].substr(0,8);
    // let time = dateAndTime[1];
    // let gmt = time.split("-");

    // let initSession = new Date(date+" "+hour);
    // let sessionDuration = initSession.getSeconds() + 60;  // todo trocar o 60 pelo tanto de tempo que o calendário der de intervalo e fazer o cálculo de acordo com esse algorítmo. 
    // //Verificar se vai ser necessário alterar o comportamento do calendário para que ele não seja editável via JS. Apenas via modal.

    // let endSession = initSession.setSeconds(sessionDuration);

    // montar objeto no calendário com o start sendo o initSession e o end sendo o endSession.

    handleDateClick(arg);

  },
  eventClick: (arg) => {
     handleEventClick(arg);
  },
  //contentHeight: 650,
  aspectRatio: 2.4,
  businessHours: {
    startTime: '08:00',
    endTime: '18:00', 
  },
  events: props.events,
  eventDisplay: 'block',
  eventTimeFormat: { // like '14:30:00'
    hour: '2-digit',
    minute: '2-digit',
    //second: '2-digit',
    meridiem: false
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