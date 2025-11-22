## Happy scenario
    @Autowired
    @InjectMocks
    ErrorHandler errorHandler;
    @Mock
    MyConfig config;
    @Mock
    JmsTemplate jmsTemplate;

    when(config.getQueueEnabled()).thenReturn(true);
    when(config.getErrorQueue()).thenReturn("errorQueue");
    when(config.jmsTemplate()).thenReturn(jmsTemplate);
    errorHandler.processError("SOAP", "ABC123");
    verify(jmsTemplate).convertAndSend("SOAP", "ABC123");
  
## Test Exception is thrown and handled (swallowed)
    when(config.getQueueEnabled()).thenReturn(true);
    when(config.getErrorQueue()).thenReturn("errorQueue");
    when(config.jmsTemplate()).thenThrow(Exception.class);
    errorHandler.processError("SOAP", "ABC123");//no exception is thrown. errorHandler.processError swallows any exceptions.

## Test Exception is thrown
    @Test(expected=MyException.class)
    public void mytest() throw Exception {
      Exception e = new ResourceAccessException("I/O error");
      Observable o = Observable.just(e);
      when(myobj.method()).thenReturn(o);
    }

## MockitoJUnitRunner does not load Spring configuration. Use SpringRunner plus:
    @Rule public MockitoRule mockitoRule = MockitoJUnit.rule();
    Applying  @Autowired to the bean with @InjectMocks so the Spring configuration can be injected into the bean.  

## Verify a mock is not invoked
    verifyNoMoreInteractions(<your mock1>, <your mock2>...);

## Mock private field
    ReflectionTestUtils.setField(underTestObject, "person", mockedPerson);

## Mock protected method
    doReturn(mockProfile).when(BaseService)service).getCustProfile("profile123");
    
## Clear the interactions and reset the stubbing of a mock object after a test case completes
    This is to ensure a clean state for subsequent tests when a private field is used in mutiple test cases.
    Mockito.reset()

    @BeforeEach
    void setUp() {
        reset(mockedObject);
    }

    Or:
    @AfterEach
    void tearDown() {
        reset(mockedObject); 
    }
    
