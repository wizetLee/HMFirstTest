if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface WZBody_Params {
    isJZPageShowConsume?: boolean;
    message?: string;
    result?: SizeResult;
    pageInfos?: NavPathStack;
}
import { pageOneTmp } from "@bundle:com.example.firsttest/entry/ets/pages/PageOne";
import { pageTwoTmp } from "@bundle:com.example.firsttest/entry/ets/pages/PageTwo";
import { pageThreeTmp } from "@bundle:com.example.firsttest/entry/ets/pages/PageThree";
export class WZBody extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__isJZPageShowConsume = this.initializeConsume("isJZPageShowConsume", "isJZPageShowConsume");
        this.__message = new SynchedPropertySimpleOneWayPU(params.message, this, "message");
        this.result = {
            width: 0,
            height: 0
        };
        this.__pageInfos = new ObservedPropertyObjectPU(new NavPathStack(), this, "pageInfos");
        this.addProvidedVar("pageInfos", this.__pageInfos, false);
        this.setInitiallyProvidedValue(params);
        this.declareWatch("isJZPageShowConsume", this.pageShowState);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: WZBody_Params) {
        if (params.result !== undefined) {
            this.result = params.result;
        }
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: WZBody_Params) {
        this.__message.reset(params.message);
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__isJZPageShowConsume.purgeDependencyOnElmtId(rmElmtId);
        this.__message.purgeDependencyOnElmtId(rmElmtId);
        this.__pageInfos.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__isJZPageShowConsume.aboutToBeDeleted();
        this.__message.aboutToBeDeleted();
        this.__pageInfos.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __isJZPageShowConsume: ObservedPropertyAbstractPU<boolean>;
    get isJZPageShowConsume() {
        return this.__isJZPageShowConsume.get();
    }
    set isJZPageShowConsume(newValue: boolean) {
        this.__isJZPageShowConsume.set(newValue);
    }
    pageShowState() {
        console.log(`isJZPageShowConsume = ${this.isJZPageShowConsume}`);
    }
    private __message: SynchedPropertySimpleOneWayPU<string>;
    get message() {
        return this.__message.get();
    }
    set message(newValue: string) {
        this.__message.set(newValue);
    }
    private result: SizeResult;
    // // 第一步：获得各子组件的大小，可以自定义组件的大小
    // onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    //   // constraint.maxWidth
    //   // constraint.maxHeight
    //   let size = 100;
    //   children.forEach((child) => {
    //     let result: MeasureResult = child.measure({ minHeight: size, minWidth: size, maxWidth: size, maxHeight: size })
    //     size += result.width / 2;
    //   })
    //   this.result.width = 100;
    //   this.result.height = 400;
    //   return this.result;
    // }
    //
    // // 第二步：放置各子组件的位置
    // onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    //   let startPos = 300;
    //   children.forEach((child) => {
    //     let pos = startPos - child.measureResult.height;
    //     child.layout({ x: pos, y: pos })
    //   })
    // }
    private __pageInfos: ObservedPropertyObjectPU<NavPathStack>;
    get pageInfos() {
        return this.__pageInfos.get();
    }
    set pageInfos(newValue: NavPathStack) {
        this.__pageInfos.set(newValue);
    }
    PageMap(name: string, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (name === "NavDestinationTitle1") {
                this.ifElseBranchUpdateFunction(0, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new pageOneTmp(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/body.ets", line: 53, col: 7 });
                                ViewPU.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "pageOneTmp" });
                    }
                });
            }
            else if (name === "NavDestinationTitle2") {
                this.ifElseBranchUpdateFunction(1, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new pageTwoTmp(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/body.ets", line: 55, col: 7 });
                                ViewPU.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "pageTwoTmp" });
                    }
                });
            }
            else if (name === "NavDestinationTitle3") {
                this.ifElseBranchUpdateFunction(2, () => {
                    {
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            if (isInitialRender) {
                                let componentCall = new pageThreeTmp(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/body.ets", line: 57, col: 7 });
                                ViewPU.create(componentCall);
                                let paramsLambda = () => {
                                    return {};
                                };
                                componentCall.paramsGenerator_ = paramsLambda;
                            }
                            else {
                                this.updateStateVarsOfChildByElmtId(elmtId, {});
                            }
                        }, { name: "pageThreeTmp" });
                    }
                });
            }
            else {
                this.ifElseBranchUpdateFunction(3, () => {
                });
            }
        }, If);
        If.pop();
    }
    navigationWidget(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Navigation.create(this.pageInfos, { moduleName: "entry", pagePath: "entry/src/main/ets/pages/body", isUserCreateStack: true });
            Navigation.title("this.NavigationTitle");
            Navigation.titleMode(NavigationTitleMode.Full);
            Navigation.toolbarConfiguration([
            // {
            //   value: $r("app.string.navigation_toolbar_add"),
            //   icon: $r("app.media.ic_public_highlightsed")
            // },
            // {
            //   value: $r("app.string.navigation_toolbar_app"),
            //   icon: $r("app.media.ic_public_highlights")
            // },
            // {
            //   value: $r("app.string.navigation_toolbar_collect"),
            //   icon: $r("app.media.ic_public_highlights")
            // }
            ]);
            Navigation.hideTitleBar(false);
            Navigation.hideToolBar(false);
            Navigation.onTitleModeChange((titleModel: NavigationTitleMode) => {
                console.info('titleMode' + titleModel);
            });
            Navigation.mode(NavigationMode.Stack);
            Navigation.navDestination({ builder: this.PageMap.bind(this) });
        }, Navigation);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ placeholder: 'search...' });
            TextInput.width('90%');
            TextInput.height(40);
            TextInput.backgroundColor('#FFFFFF');
            TextInput.margin({ top: 8 });
        }, TextInput);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 12, initialIndex: 0 });
            List.height(324);
            List.width('100%');
            List.margin({ top: 12, left: '10%' });
        }, List);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const item = _item;
                {
                    const itemCreation = (elmtId, isInitialRender) => {
                        ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
                        itemCreation2(elmtId, isInitialRender);
                        if (!isInitialRender) {
                            ListItem.pop();
                        }
                        ViewStackProcessor.StopGetAccessRecording();
                    };
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        ListItem.create(deepRenderFunction, true);
                        ListItem.onTouch((event) => {
                            if (event.type == TouchType.Down) {
                                // 页面导航
                                // NavDestinationTitle1
                                // NavDestinationTitle2
                                // NavDestinationTitle3
                                // NavPathStack
                                this.pageInfos.pushPath({ name: "NavDestinationTitle" + item });
                                //FIXME: 修改路由方式
                            }
                        });
                    };
                    const deepRenderFunction = (elmtId, isInitialRender) => {
                        itemCreation(elmtId, isInitialRender);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create('' + item);
                            Text.width('90%');
                            Text.height(72);
                            Text.backgroundColor('#FFFFFF');
                            Text.borderRadius(24);
                            Text.fontSize(16);
                            Text.fontWeight(500);
                            Text.textAlign(TextAlign.Center);
                        }, Text);
                        Text.pop();
                        ListItem.pop();
                    };
                    this.observeComponentCreation2(itemCreation2, ListItem);
                    ListItem.pop();
                }
            };
            this.forEachUpdateFunction(elmtId, [1, 2, 3], forEachItemGenFunction, (item: number) => item.toString(), false, false);
        }, ForEach);
        ForEach.pop();
        List.pop();
        Navigation.pop();
    }
    initialRender() {
        this.navigationWidget.bind(this)();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
